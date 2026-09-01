public Boolean isBirthday(Contact c) {
    Date hoje = System.today();
    
    Integer dia_hoje = hoje.day();
    Integer mes_hoje = hoje.month();

    Integer dia_aniversario = c.Birthdate.day();
    Integer mes_aniversario = c.Birthdate.month();

    if(dia_hoje == dia_aniversario && mes_hoje == mes_aniversario){
        return true;
    }
    return false;

}
