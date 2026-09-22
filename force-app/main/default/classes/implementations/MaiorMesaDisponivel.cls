public class MaiorMesaDisponivel implements PoliticaAlocacaoMesa{
    public Mesa selecionarMesa(
        List<Mesa> mesas,
        QuantidadePessoas qtdPessoas,
        Localizacao local,
        PeriodoReserva.pReserva periodo
    ){
        Mesa melhorMesa = null;

        for(Mesa m : mesas){
            if(melhorMesa == null || m.capacidade > melhorMesa.capacidade ){
                melhorMesa = m;
            }
        }
        return melhorMesa;
    }
    
}