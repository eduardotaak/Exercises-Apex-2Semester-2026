public interface PoliticaAlocacaoMesa {
    Mesa selecionarMesa(List<Mesa> mesas, QuantidadePessoas qtdpessoas, Localizacao localizar, PeriodoReserva.pReserva periodo);
}