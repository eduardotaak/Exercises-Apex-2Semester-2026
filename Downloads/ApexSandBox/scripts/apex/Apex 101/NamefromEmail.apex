public String nameFromEmail(String email) {
    String resultado = '';
    resultado = email.substring(0, email.indexOf('@'));
    resultado = resultado.toLowerCase();

    String firstName = resultado.substring(0, resultado.indexOf('.'));
    String lastName = resultado.substring(resultado.indexOf('.') + 1);

    String msg = '';

    msg = firstName.capitalize() + ' ' + lastName.capitalize();
    return msg;
}