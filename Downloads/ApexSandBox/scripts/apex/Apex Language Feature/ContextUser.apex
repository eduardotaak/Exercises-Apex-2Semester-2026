public Map<String,String> getContextUserInformation(){

    Map<String, String> usuario = new Map<String, String>();
    String email = UserInfo.getUserEmail();
    String profiled = UserInfo.getProfileId();
    String tipo = UserInfo.getUserType();
    String userName = UserInfo.getUserName();

    usuario.put('EmailId', email);
    usuario.put('ProfileId',profiled);
    usuario.put('Type',tipo);
    usuario.put('UserName',userName);

    return usuario;
}