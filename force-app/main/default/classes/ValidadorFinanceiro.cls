public class ValidadorFinanceiro {
    public static Decimal devolverValor(Decimal valor) {
        if(valor <= 0){
            throw new IllegalArgumentException('Informe um valor superior a 0!');
        }
        return valor;
    }
}