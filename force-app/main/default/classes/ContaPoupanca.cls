public class ContaPoupanca extends Conta{
    public ContaPoupanca(Integer numero, String nomeTitular) {
        super(numero, nomeTitular);
    }

    public override Decimal calcularTaxa(){
        return saldo * 0.005;
    }
}