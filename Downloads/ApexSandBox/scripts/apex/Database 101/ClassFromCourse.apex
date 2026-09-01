public Id classFromCourse(String courseName) {
    list<apxio__Course__c> course = [
        SELECT Id, Name
        FROM apxio__Course__c
        WHERE Name = :courseName
    ];

    apxio__Class__c classe = new apxio__Class__c();

    if(!course.isEmpty()){
        classe.Name = courseName;
        classe.apxio__Course__c = course[0].Id;
    }else{
        return null;
    }

    insert classe;
    return classe.Id;
}