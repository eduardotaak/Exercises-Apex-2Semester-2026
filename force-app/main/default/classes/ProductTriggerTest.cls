@isTest
private class ProductTriggerTest {

    @isTest
    static void testProductStandardPricebookEntryCreation() {
        Id standardPbId = Test.getStandardPricebookId();

        Pricebook2 standardPb = new Pricebook2(
            Id = standardPbId,
            IsActive = true
        );
        update standardPb;

        List<Product2> produtosParaInserir = new List<Product2>();
        for (Integer i = 0; i < 200; i++) {
            produtosParaInserir.add(new Product2(
                Name = 'Produto Teste ' + i,
                IsActive = true
            ));
        }

        Test.startTest();
        insert produtosParaInserir;
        Test.stopTest();

        List<PricebookEntry> entriesCriadas = [
            SELECT Id, Product2Id, Pricebook2Id, UnitPrice, IsActive 
            FROM PricebookEntry 
            WHERE Pricebook2Id = :standardPbId AND Product2Id IN :produtosParaInserir
        ];

        System.assert(!entriesCriadas.isEmpty(), 'As entradas no catálogo padrão devem ter sido criadas.');
    }
}