public void validateInsert(List<Opportunity> opportunities){
    for(Opportunity oportunidade : opportunities){
        if(oportunidade.StageName == 'Closed Won' && String.isBlank(oportunidade.Description)){
            oportunidade.addError('Description should not be empty for Closed Won opportunity.');
        }
    }
}
