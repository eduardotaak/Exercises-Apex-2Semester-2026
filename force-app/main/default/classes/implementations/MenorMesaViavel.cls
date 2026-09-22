public class MenorMesaViavel implements PoliticaAlocacaoMesa {

    public Mesa selecionarMesa(
        List<Mesa> mesas,
        QuantidadePessoas qtdPessoas,
        Localizacao local,
        PeriodoReserva.pReserva periodo){

        Mesa melhorMesa = null;
    
        for (Mesa mesa : mesas) {
            if(melhorMesa == null || mesa.capacidade < melhorMesa.capacidade){
                melhorMesa = mesa;
            }
        }
        return melhorMesa;
    }
}
