public Boolean sameParent(Account acc, Contact con, Opportunity opp) {
    if(con.AccountId == null && con.AccountId == null){
        return false;
    }
    if(!(con.AccountId == opp.AccountId && opp.AccountId == acc.Id)){
        return false;
    }
    return true;
}