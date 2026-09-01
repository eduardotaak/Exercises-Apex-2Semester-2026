public String formatName(String firstName, String lastName) {

    if(!String.isBlank(firstName) && !String.isBlank(lastName)){
        return lastName + ', ' + firstName;
    }

    if(String.isBlank(firstName) && String.isBlank(lastName)){
        return '';
    } 

    if(String.isBlank(firstName)){
        return lastName;
    }
    return firstName;
}