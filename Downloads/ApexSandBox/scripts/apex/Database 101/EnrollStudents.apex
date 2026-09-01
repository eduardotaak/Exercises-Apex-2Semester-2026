public void enrollStudents(List<String> emails, String className) {
    List<apxio__Student__c> estudantes = [
        SELECT Id
        FROM apxio__Student__c
        WHERE apxio__Email__c IN :emails];

    List<apxio__Class__c> classes = [
        SELECT Id
        FROM apxio__Class__c
        WHERE Name = :className];

    if (classes.isEmpty()){ 
    return;
    }
    List<apxio__Class_Enrollment__c> matriculados = new List<apxio__Class_Enrollment__c>();

    for (apxio__Student__c estudante : estudantes){
        matriculados.add(new apxio__Class_Enrollment__c(
            apxio__Student__c = estudante.Id,
            apxio__Offered_Class__c = classes[0].Id));
    }

    if (!matriculados.isEmpty()) insert matriculados;

}