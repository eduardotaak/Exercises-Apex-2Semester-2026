public class ALTriggerHandler extends TriggerHandler{
    public override void afterInsert(){
        // instance of the sets and lists to keep the infos abt the users id, accounts id and associated location
        List<AssociatedLocation> localAssociado = (List<AssociatedLocation>) Trigger.new;
        Set<Id> idAccounts = new Set<Id>();
        Set<Id> users = new Set<Id>();
        Set<String> existentsKeys = new Set<String>();
        // the list we will insert in the final
        List<AccountTeamMember> membersToInsert = new List<AccountTeamMember>();

        // verify if its empty
        if(localAssociado.isEmpty()){return;}

        // loops over localAssociado and add the parent record and location ids
        for(AssociatedLocation acc: localAssociado){
            idAccounts.add(acc.ParentRecordId);
            users.add(acc.Representante__c);
        }

        // soql to keep the idAccount and the idUsers and save into a List
        List<AccountTeamMember> existsUsers = [SELECT AccountId, UserId FROM AccountTeamMember WHERE AccountId IN :idAccounts AND UserId IN :users];

        //loop over the existsUser string set and add the account id and user id from acc (account team member)
        for(AccountTeamMember acc : existsUsers){
            existentsKeys.add(acc.AccountId + '-' + acc.UserId);
        }

        // loop over localAssociado and creates a string called chave, add the record id and the location id
        for(AssociatedLocation al : localAssociado){
            String chave = al.ParentRecordId + '-' + al.Representante__c;
            
            // verify if the list contains chave, if isnt intence a ATM and add
            if(!existentsKeys.contains(chave)){
                existentsKeys.add(al.ParentRecordId + '-' + al.Representante__c);
                AccountTeamMember obj = new AccountTeamMember();
                obj.AccountId = al.ParentRecordId;
                obj.UserId = al.Representante__c;
                membersToInsert.add(obj);
            }
        }
        // insert 
        insert membersToInsert;
    }
    // method that override the afterupdate 
    public override void afterUpdate(){
        List<AssociatedLocation> localAssociado = (List<AssociatedLocation>) Trigger.new;
        Map<Id, AssociatedLocation> old = (Map<Id, AssociatedLocation>) Trigger.oldMap;
        List<AccountTeamMember> membersToInsert = new List<AccountTeamMember>();
        Set<Id> idAccounts = new Set<Id>();
        Set<Id> users = new Set<Id>();
        Set<String> chavesDeleta = new Set<String>(); 

        // verify if the representant or account have change
        for(AssociatedLocation acc : localAssociado){
            AssociatedLocation oldAcc = old.get(acc.Id);
            // no its the same: do nothing
            if(acc.Representante__c == oldAcc.Representante__c && acc.ParentRecordId == oldAcc.ParentRecordId){
                continue;
            }else{
                //ParentRecordId:  field that holds the Account ID for those Location
                idAccounts.add(acc.ParentRecordId);
                idAccounts.add(oldAcc.ParentRecordId);
                // Representante__c (custom field created by me): field that holds User ID responsible for those Associated Location
                users.add(acc.Representante__c);
                users.add(oldAcc.Representante__c);

                // if its not null, add to deleta list (using AccountId-UserId)
                if(oldAcc.Representante__c != null && oldAcc.ParentRecordId != null){
                    chavesDeleta.add(oldAcc.ParentRecordId + '-' + oldAcc.Representante__c);
                }
                
                if(acc.Representante__c != null && acc.ParentRecordId != null){
                    //yes: so add the information into nMembro after add int membersToInsert
                    AccountTeamMember nMembro = new AccountTeamMember();
                    nMembro.AccountId = acc.ParentRecordId;
                    nMembro.UserId = acc.Representante__c;
                    membersToInsert.add(nMembro);
                }
            }
        }

        // verify if the previous representant still have a another AL in the same old account
        List<AssociatedLocation> outroLA = [SELECT ParentRecordId, Representante__c FROM AssociatedLocation WHERE ParentRecordId IN :idAccounts AND Representante__c IN :users AND Id NOT IN :old.keySet()];
        for(AssociatedLocation al : outroLA){
            String chave = al.ParentRecordId + '-' + al.Representante__c;
            // remove from delete list if they still have another AL
            if(chavesDeleta.contains(chave)){
                chavesDeleta.remove(chave);
            }
        }
        // create the membersToDelete to delete in the final code, given that apex dont support deletes in a loop
        List<AccountTeamMember> membersToDelete = new List<AccountTeamMember>();
        if(!chavesDeleta.isEmpty()){
            List<AccountTeamMember> existsUsers = [SELECT Id, AccountId, UserId FROM AccountTeamMember WHERE AccountId IN :idAccounts AND UserId IN :users];
            for(AccountTeamMember atm : existsUsers){
                // add into a string and after add into members to delete, to delete all in the final
                String chave = atm.AccountId + '-' + atm.UserId;
                if(chavesDeleta.contains(chave)){
                    membersToDelete.add(atm);
                }
            }
        }

        if(!membersToDelete.isEmpty()){
            try{
                // i've used this 'as user' to add a security level extra, to ensure that nobody execute actions that profile not allowed in interface
                delete as user membersToDelete;
            }catch(DmlException e){
                System.debug('O usuario nao tem permissao para deletar. Tente novamente!');
            }
        }

        if(!membersToInsert.isEmpty()){
            insert membersToInsert;
        }
    }

    public override void afterDelete(){
        List<AssociatedLocation> localAssociado = (List<AssociatedLocation>) Trigger.old;

        Set<Id> idAccounts = new Set<Id>();
        Set<Id> users = new Set<Id>();
        Set<String> chavesDeleta = new Set<String>();
        List<AccountTeamMember> membersToDelete = new List<AccountTeamMember>();
        // loop over localAssociado, verify and add into accounts users and chaveDeleta
        for(AssociatedLocation acc : localAssociado){
            if(acc.Representante__c != null && acc.ParentRecordId != null){
                idAccounts.add(acc.ParentRecordId);
                users.add(acc.Representante__c);
                chavesDeleta.add(acc.ParentRecordId + '-' + acc.Representante__c);
            }
        }
        // two times a if, one foe select the fields and other to select the Ids, one removes and the other add to delete in the final following the apex way
        if(!chavesDeleta.isEmpty()){
            List<AssociatedLocation> outroLA = [SELECT ParentRecordId, Representante__c FROM AssociatedLocation WHERE ParentRecordId IN : idAccounts AND Representante__c IN :users];
            for(AssociatedLocation acc : outroLA){
                String key = acc.ParentRecordId + '-' + acc.Representante__c;
                if(chavesDeleta.contains(key)){
                    chavesDeleta.remove(key);
                }
            }
        }

        if(!chavesDeleta.isEmpty()){
            List<AccountTeamMember> existsUsers = [SELECT Id, AccountId, UserId FROM AccountTeamMember WHERE AccountId IN :idAccounts AND UserId IN :users];
            for(AccountTeamMember atm : existsUsers){
                String chave = atm.AccountId + '-' + atm.UserId;
                if(chavesDeleta.contains(chave)){
                    membersToDelete.add(atm);
                }
            }
        }
        // delete in the final with a try/catch to treat the exceptions
        if(!membersToDelete.isEmpty()){
            try{
                delete as user membersToDelete;
            }catch(DmlException e){
                System.debug('Usuario nao possui permissao para deletar. Tente novamente!');
            }
        }
    }
}