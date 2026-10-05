public class ProductTriggerHandler extends TriggerHandler {

    public override void afterInsert() {
        List<Product2> produtosNovos = (List<Product2>) Trigger.new;
        
        Id idCatalogo;
        try {
            Pricebook2 catalogoPadrao = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
            idCatalogo = catalogoPadrao.Id;
        } catch (Exception e) {
            return;
        }
        
        List<String> listaMoedas = new List<String>();
        try {
            for (SObject tipoMoeda : Database.query('SELECT IsoCode FROM CurrencyType WHERE IsActive = true')) {
                listaMoedas.add((String)tipoMoeda.get('IsoCode'));
            }
        } catch (Exception e) {
            listaMoedas.add(UserInfo.getDefaultCurrency());
        }
        
        if (listaMoedas.isEmpty()) {
            listaMoedas.add(UserInfo.getDefaultCurrency());
        }
        
        List<PricebookEntry> entradasNovas = new List<PricebookEntry>();
        
        for (Integer i = 0; i < produtosNovos.size(); i++) {
            Product2 prod = produtosNovos[i];
            
            for (Integer j = 0; j < listaMoedas.size(); j++) {
                String moedaAtual = listaMoedas[j];
                
                PricebookEntry pbe = new PricebookEntry();
                pbe.Product2Id = prod.Id;
                pbe.Pricebook2Id = idCatalogo;
                pbe.UnitPrice = 0.0;
                pbe.IsActive = true;
                
                try {
                    pbe.put('CurrencyIsoCode', moedaAtual);
                } catch (Exception e) {
                }
                
                entradasNovas.add(pbe);
            }
        }
        
        if (entradasNovas.size() > 0) {
            Database.insert(entradasNovas, false);
        }
    }
}