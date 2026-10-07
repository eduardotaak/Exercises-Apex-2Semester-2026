trigger ALTrigger on AssociatedLocation (after insert, after update, after delete) {
    new ALTriggerHandler().run();
}