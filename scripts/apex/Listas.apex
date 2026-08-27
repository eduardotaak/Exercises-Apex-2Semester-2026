public class TesteSacar{
    public void testeSacar(Decimal valor, Decimal saque){
        try{
            ContaCorrente eduardo = new ContaCorrente(123, 'eduardo');
            eduardo.depositar(valor);
            eduardo.sacar(saque);
        }catch(SaldoInsuficienteException e){
            throw new SaldoInsuficienteException('Valor insuficiente!');
        }
    }
}
//testes de funcionamento do metodo sacar()
TesteSacar novoteste = new TesteSacar();
novoteste.testeSacar(1000, 1001);

