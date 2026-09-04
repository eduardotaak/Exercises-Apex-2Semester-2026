public static List<Contact> ContactDeduplicator(List<Contact> contacts) {
    Set<String> set_emails = new Set<String>();
    List<Contact> emails = new List<Contact>();

    if(contacts == null){
        return emails;
    }

    for(Contact ctt : contacts){
        if(String.isNotBlank(ctt.Email)){
            String email = ctt.Email.toLowerCase();
            if(set_emails.contains(email)){
            }else{
                set_emails.add(email);
                emails.add(ctt);
            }
        }
        else{
            if(set_emails.contains('')){
            }else{
                set_emails.add('');
                emails.add(ctt);
            }
        }
    }


    return emails;
}