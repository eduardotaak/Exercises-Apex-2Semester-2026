public String convert15to18DigitId(String fifteenDigit){
    if(fifteenDigit == null){
        return null;
    }
    if(fifteenDigit.length() != 15){
        return String.valueOf(-1);
    }
    Id valor = Id.valueOf(fifteenDigit);
    return valor;

}
