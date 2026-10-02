trigger TriggerTask on Task (before insert, before update) {
    new ValidationTrigger().run();
}

