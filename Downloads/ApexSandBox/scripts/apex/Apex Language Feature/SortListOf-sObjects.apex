public List<Account> getAccounts(List<Account> accounts) {
    if(accounts == null){
        return null;
    }
    accounts.sort(new Comparador());
    return accounts;
}

public class Comparador implements Comparator<Account> {
    public Integer compare(Account o1, Account o2) {
        Integer returnValue = 0;
        if(o1 == null && o2 == null) {
            return 0;
        } else if(o1 == null) {
            returnValue = -1; 
        } else if(o2 == null) {
            returnValue = 1;
        } else if ((o1.AnnualRevenue == null) && (o2.AnnualRevenue == null)) {
            return 0;
        } else if (o1.AnnualRevenue == null){
            returnValue = -1;
        } else if (o2.AnnualRevenue == null){
            returnValue = 1;
        } else if (o1.AnnualRevenue < o2.AnnualRevenue) {
            returnValue = 1;
        } else if (o1.AnnualRevenue > o2.AnnualRevenue) {
            returnValue = -1;
        }
        return returnValue;
    }
}