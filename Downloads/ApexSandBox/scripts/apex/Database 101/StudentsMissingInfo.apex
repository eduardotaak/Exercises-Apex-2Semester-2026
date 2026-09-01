public List<apxio__Student__c> selectStudentsWithoutContactInfo() {
    List <apxio__Student__c> estudantes = [
        SELECT Id, Name FROM apxio__Student__c WHERE
        apxio__Active__c = TRUE AND
        (apxio__Email__c = NULL OR apxio__Phone__c = NULL)
        ORDER by Name ASC
    ];

    return estudantes;
}