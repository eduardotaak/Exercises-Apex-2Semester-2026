public Set<Id> accountIds(List<Opportunity> opps) {
    Set<Id> ids = new Set<Id>();
    for(Opportunity op : opps){
        if(!String.isBlank(op.AccountId)){
            ids.add(op.AccountId);
        }
    }
    return ids;
}