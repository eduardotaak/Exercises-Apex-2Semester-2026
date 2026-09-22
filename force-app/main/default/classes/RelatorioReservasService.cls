public class RelatorioReservasService {

    public Map<String, List<Reserva>> gerarRelatorioPorCliente(List<Restaurante> restaurantes) {
        Map<String, List<Reserva>> relatorio = new Map<String, List<Reserva>>();

        if (restaurantes == null || restaurantes.isEmpty()) {
            return relatorio;
        }

        for (Restaurante rest : restaurantes) {
            if (rest.Reserva != null) {
                for (Reserva r : rest.Reserva) {
                    if (r.cliente != null && r.cliente.cpf.getNumero() != null &&  r.sRestaurante == StatusReserva.sReserva.CONFIRMADA){
                        String docCliente = r.cliente.cpf.getNumero();
                        if (!relatorio.containsKey(docCliente)) {
                            relatorio.put(docCliente, new List<Reserva>());
                        }
                        relatorio.get(docCliente).add(r);
                    }
                }
            }
        }
        return relatorio;
    }
}