public class CadastroDeContas {
    private static List<Conta> contas = new List<Conta>();

    public void adicionarConta(Conta conta){
        contas.add(conta);
    }

    public List<Conta> mostrarConta(){
        return new List<Conta>(contas);
    }

    public Decimal calcularTotalContas(List<Conta> contas){
        Decimal total = 0;
        for(Integer i = 0; i < contas.size(); i++){
            total += contas[i].calcularTaxa();
        }
        return total;
    }
}