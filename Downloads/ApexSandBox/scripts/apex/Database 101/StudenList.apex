public void insertStudents(List<String> studentNames, List<String> studentEmails) {
    List<apxio__Student__c> students = new List<apxio__Student__c>();
    for(Integer i = 0; i < studentEmails.size(); i++){
        apxio__Student__c estudante = new apxio__Student__c();
        estudante.Name = studentNames[i];
        estudante.apxio__Email__c = studentEmails[i];

        students.add(estudante);
    }
    insert students;
}