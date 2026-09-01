public List<Account> getAccountsFromJSONString(String inputJSON){
    if(inputJSON == null){
        return null;
    }else{
        List<Account> acc = (List<Account>) JSON.deserialize(inputJSON, List<Account>.class);
        return acc;
}
}