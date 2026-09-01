public void createCourseAndClass(String name, String description) {
    apxio__Course__c course = new apxio__Course__c();
    course.Name = name;
    course.apxio__Course_Details__c = description;

    insert course;

    apxio__Class__c classe = new apxio__Class__c();
    classe.Name = name;
    if(description == null){
    }
    else{
    classe.apxio__Description__c = description.left(255);
    }
    classe.apxio__Course__c = course.Id;

    insert classe;
}