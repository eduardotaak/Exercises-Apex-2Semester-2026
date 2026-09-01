public Boolean isKeyAccount(Account a) {
    if(a.AnnualRevenue == 500000){
        a.Industry = 'All others';
        return true;
    }else if(a.AnnualRevenue == 600000){
        a.Industry = 'Banking';
        return true;
    }else if(a.AnnualRevenue == 800000){
        a.Industry = 'Technology';
        return true;
    }else if(a.AnnualRevenue == 2000000){
        a.Industry = 'Retail';
        return true;
    }
    return false;
}