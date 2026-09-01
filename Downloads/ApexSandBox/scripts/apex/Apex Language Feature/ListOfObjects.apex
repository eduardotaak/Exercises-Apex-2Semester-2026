public List<sObject> getListOfsObject(List<Account> accounts, List<Contact> contacts){
    List<SObject> lista = new List<SObject>(); 
    
    if(accounts == null && contacts == null){
        return lista;
    }

    if(accounts != null){
        for(Account acc : accounts){
            lista.add(acc);
        }
    }

    if(contacts != null){
        for(Contact contato : contacts){
            lista.add(contato);
        }
    }

    
    return lista;
}