public class CalculadoraDeImpostos {
    public Decimal calcularImposto(List <Tributavel> valor) {
        Decimal total = 0;
        for(Integer i = 0; i < valor.size(); i++){
            total += valor[i].calcularImposto();
        }
        return total;
    }
}