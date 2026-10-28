public class OrderItemTriggerHandler extends TriggerHandler{

    public override void beforeInsert(){

        List<OrderItem> newOrderItem = (List<OrderItem>) Trigger.new;
        Set<Id> idOrder = new Set<Id>();

        for(OrderItem odd : newOrderItem){
            if(odd.OrderId != null){
                idOrder.add(odd.OrderId);
            }
        }

        Map<Id, Order> orderParent = new Map<Id, Order>([SELECT Id, Status FROM Order WHERE Id IN :idOrder]);
        List<OrderItem> items = new List<OrderItem>();

        for(OrderItem opt : newOrderItem){
            Boolean flag = true;
            Order parentOrder = orderParent.get(opt.OrderId);

            if(parentOrder != null && parentOrder.Status == 'Activated'){
                flag = false;
                opt.addError('Erro ao tentar alterar, tente novamente mais tarde ou chame um desenvolvedor!');
            }
            if(opt.Quantity == null || opt.Quantity <= 0 || opt.UnitPrice == null || opt.UnitPrice <= 0){
                flag = false;
                opt.addError('Quantidade e/ou preco devem ser maiores que zero');
            }
            if(flag){
                items.add(opt);
            }
        }

        if(items.size() >= 1){
            itemsToProcess(items);
        }
    }

    
    public override void beforeUpdate(){
        List<OrderItem> newOrderItem = (List<OrderItem>) Trigger.new; 
        Map<Id, OrderItem> oldOrderItem = (Map<Id, OrderItem>) Trigger.oldMap;
        Set<Id> idOrder = new Set<Id>();

        for(OrderItem odd : newOrderItem){
            if(odd.OrderId != null){
                idOrder.add(odd.OrderId);
            }
        }

        Map<Id, Order> orderParent = new Map<Id, Order>([SELECT Id, Status FROM Order WHERE Id IN :idOrder]);
        List<OrderItem> items = new List<OrderItem>();

        for(OrderItem opt : newOrderItem){
            Boolean flag = true;
            Order parentOrder = orderParent.get(opt.OrderId);
            OrderItem oldItem = oldOrderItem.get(opt.Id);

            if(parentOrder != null && parentOrder.Status == 'Activated'){
                flag = false;
                opt.addError('Erro ao tentar alterar, tente novamente mais tarde ou chame um desenvolvedor!');
            }
            if(opt.Quantity == null || opt.Quantity <= 0 || opt.UnitPrice == null || opt.UnitPrice <= 0){
                flag = false;
                opt.addError('Quantidade e/ou preco devem ser maiores que zero');
            }
            if(opt.Quantity != oldItem.Quantity || opt.Product2Id != oldItem.Product2Id || opt.UnitPrice != oldItem.UnitPrice){
                if(flag){
                    items.add(opt);
                }
            }
        }

        if(items.size() >= 1){
            itemsToProcess(items);
        }
    }



    @TestVisible
    private void itemsToProcess(List<OrderItem> itens){
        Set<Id> idOrderItem = new Set<Id>();
        Set<Id> productId = new Set<Id>();
        Set<Id> accountId = new Set<Id>();
        Set<Id> distributionCenter = new Set<Id>();
        Set<String> states = new Set<String>();
        Set<String> cities = new Set<String>();
        Set<String> countries = new Set<String>();

        for(OrderItem item : itens){
            if(item.OrderId != null && item.Product2Id != null){
                idOrderItem.add(item.OrderId);
                productId.add(item.Product2Id);
            }
        }

        Map<Id, Order> orderMap = new Map<Id, Order>([SELECT Id, AccountId, Account.Client_Group__c, ShippingCity, ShippingState, ShippingCountry, Distribution_Center__c,
        Address__c, Address__r.City__c, Address__r.City__r.State__c, Address__r.City__r.State__r.Country__c FROM Order WHERE Id IN :idOrderItem]);
        Map<Id, Product2> productMap = new Map<Id, Product2>([SELECT Id, Product_Hierarchy__c, Product_cost__c FROM Product2 WHERE Id IN :productId]);

        for(Order odr : orderMap.values()){
            if(odr.Distribution_Center__c != null){
                distributionCenter.add(odr.Distribution_Center__c);
            }
            if(odr.Address__r?.City__r?.State__c != null){
                states.add(odr.Address__r.City__r.State__c);
            }
            if(odr.Address__r?.City__c != null){
                cities.add(odr.Address__r.City__c);
            }
            if(odr.Address__r?.City__r?.State__r?.Country__c != null){
                countries.add(odr.Address__r.City__r.State__r.Country__c);
            }
            if(odr.AccountId != null){
                accountId.add(odr.AccountId);
            }
        }

        for(Schema.Location loc : [SELECT Id FROM Location]){
            distributionCenter.add(loc.Id);
        }

        List<Tax__c> activeTaxes = [SELECT Tax_on_cost__c, Product__c, Distribution_Center__c, State__c FROM Tax__c 
        WHERE Status__c = 'Approved' AND Distribution_Center__c IN :distributionCenter AND Product__c IN :productId AND State__c IN :states];

        Map<String, Decimal> taxMap = new Map<String, Decimal>();
        for(Tax__c tax : activeTaxes){
            String key = String.valueOf(tax.Product__c) + '_' + String.valueOf(tax.Distribution_Center__c) + '_' + tax.State__c;
            taxMap.put(key, tax.Tax_on_cost__c);
        }

        List<Freight__c> activeFreights = [SELECT Amount__c, Location__c, Product__c, Product_Hierarchy__c, City__c, State__c, Country__c, Specificity_Score__c 
        FROM Freight__c WHERE Status__c = 'Approved' AND Location__c IN :distributionCenter AND 
        (Product__c IN :productId OR Product__c = null) ORDER BY Specificity_Score__c DESC, CreatedDate DESC];

        List<Margin__c> activeMargins = [SELECT Margin_Percentage__c, Distribution_Center__c, Product__c, Product_Hierarchy__c, Account__c, Account_Group__c, City__c, State__c, Country__c, Specificity_Score__c FROM 
        Margin__c WHERE Status__c = 'Approved' AND Distribution_Center__c IN :distributionCenter AND (Product__c IN :productId OR Product__c = null) AND 
        (Account__c IN :accountId OR Account__c = null) ORDER BY Specificity_Score__c DESC, CreatedDate DESC];

        for(OrderItem item : itens){
            Order parentOrder = orderMap.get(item.OrderId);
            Product2 product = productMap.get(item.Product2Id);

            if(parentOrder == null || product == null){
                continue;
            }

            Decimal foundTax = null; Decimal foundFreight = null; Decimal foundMargin = null;

            String key = String.valueOf(item.Product2Id) + '_' + String.valueOf(parentOrder.Distribution_Center__c) + '_' + String.valueOf(parentOrder?.Address__r?.City__r?.State__c);

            if(taxMap.containsKey(key)){
                foundTax = taxMap.get(key);
            }

            for(Freight__c freight : activeFreights){
                if(((freight.Product__c == item.Product2Id) || (freight.Product__c == null && freight.Product_Hierarchy__c == product.Product_Hierarchy__c)) 
                && (freight.City__c == parentOrder.Address__r?.City__c || freight.State__c == parentOrder.Address__r?.City__r?.State__c || freight.Country__c == parentOrder.Address__r?.City__r.State__r?.Country__c)){
                    foundFreight = freight.Amount__c;
                    break;
                }
            }

            for(Margin__c margin : activeMargins){
                if((margin.Product_Hierarchy__c == product.Product_Hierarchy__c || margin.Product__c == item.Product2Id) && 
                (margin.Account__c == parentOrder.AccountId || (margin.Account__c == null && margin.Account_Group__c == parentOrder.Account?.Client_Group__c)) && 
                (margin.City__c == parentOrder.Address__r?.City__c || margin.Country__c == parentOrder.Address__r?.City__r?.State__r?.Country__c || margin.State__c == parentOrder.Address__r?.City__r?.State__c)){
                    foundMargin = margin.Margin_Percentage__c;
                    break;
                }
            }

            Decimal cost = product.Product_cost__c;

            if(foundFreight == null || foundMargin == null || foundTax == null || cost == null || cost <= 0){
                item.addError('Não está autorizada a venda deste produto devido à falta de parâmetros. Contate o time de Pricing.');
            } else {
                item.Tax_Percentage__c = foundTax;
                item.Margin_Percentage__c = foundMargin;
                item.Freight_Value__c = foundFreight;
            }
        }
    }
}