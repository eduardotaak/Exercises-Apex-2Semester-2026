public class FIFOPoliticaPListaEspera implements PoliticaPromocaoListaEspera{
    // First in First out, no caso 
    public Reserva selecionarReservaParaPromover(List<Reserva> listaEspera, Mesa mesaLiberada, PeriodoReserva.pReserva periodo){
        for(Reserva r : listaEspera){
            if(r.sRestaurante == StatusReserva.sReserva.PENDENTE &&
                    r.rRestaurante == periodo &&
                    r.localPreferencia == String.valueOf(mesaLiberada.local) &&
                    r.quantidadePessoas <= mesaLiberada.capacidade){
                    return r;
                }
            }
        return null;
    }
}