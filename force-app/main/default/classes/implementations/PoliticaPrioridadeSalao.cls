public class PoliticaPrioridadeSalao implements PoliticaAlocacaoMesa{
    public Mesa selecionarMesa(
        List<Mesa> mesas, QuantidadePessoas qtdPessoas,
        Localizacao local, PeriodoReserva.pReserva periodo){
        
        Mesa melhorMesa = null;
        for(Mesa m : mesas){
            if(m.local == LocalMesa.LocalCliente.SALAO){
                if(melhorMesa == null){
                    melhorMesa = m;
                }
            }
        }
        if(melhorMesa != null){
            return melhorMesa;
        }
        else{
            for(Mesa m : mesas){
                if(m.local == LocalMesa.LocalCliente.JARDIM){
                    melhorMesa = m;
                    return melhorMesa;
                }
            }
            return null;
        }
    }
}