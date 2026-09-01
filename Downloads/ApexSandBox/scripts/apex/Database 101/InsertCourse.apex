public Id insertCourse(String name, String details, Integer credits) {
    if(credits < 0 || credits > 4){
            return null;
    }
    apxio__Course__c course = new apxio__Course__c(
        Name = name,
        apxio__Course_Details__c = details,
        apxio__Credits__c = String.valueOf(credits)
    );
    insert course;

    return course.Id;
}