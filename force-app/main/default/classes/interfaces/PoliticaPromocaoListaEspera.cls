public interface PoliticaPromocaoListaEspera {
    Reserva selecionarReservaParaPromover(List<Reserva> listaEspera, Mesa mesaLiberada, PeriodoReserva.pReserva periodo);
}