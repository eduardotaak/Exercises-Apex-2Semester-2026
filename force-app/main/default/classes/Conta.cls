public abstract class Conta {
        public Integer numero;
        public String nomeTitular;
        public Decimal saldo = 0.0;
        public static Integer totalDeContas = 0;

    public Conta(Integer numero, String nomeTitular){
        this.numero = numero;
        this.nomeTitular = nomeTitular;
        totalDeContas++;
    }

    public void depositar(Decimal valor){
        this.saldo += ValidadorFinanceiro.devolverValor(valor);
    }

    public void sacar(Decimal valor){
        if(valor > this.saldo){
            throw new SaldoInsuficienteException('Valor insuficiente!');
        }else{
            this.saldo -= valor;
        }
    }

    public abstract Decimal calcularTaxa();

}
