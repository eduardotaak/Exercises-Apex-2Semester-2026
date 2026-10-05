trigger ProductTrigger on Product2 (after insert) {
    new ProductTriggerHandler().run();
}