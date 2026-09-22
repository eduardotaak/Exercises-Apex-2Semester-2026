public class GerenciadorReservas {
    private Restaurante restaurante;
    private PoliticaAlocacaoMesa politica;
    private PoliticaPromocaoListaEspera polticaPromocao;

    public GerenciadorReservas(Restaurante restaurante, PoliticaAlocacaoMesa politica) {
        this.politica = politica;
        this.restaurante = restaurante;
    }

    public Reserva criarReserva(
        Cliente cliente, 
        QuantidadePessoas qtdPessoas, 
        Localizacao local, 
        PeriodoReserva.pReserva periodo, 
        Boolean aceitaListaEspera
    ) {
        List<Mesa> mesasCandidatas = new List<Mesa>();
        
        for(Mesa m : this.restaurante.Mesa) {
            if(m.capacidade >= qtdPessoas.getNumeroPessoas() && m.local == local.getLocal()) {
                Boolean ocupada = false;
                for(Reserva r : this.restaurante.Reserva) {
                    if(r.sRestaurante == StatusReserva.sReserva.CONFIRMADA && r.rRestaurante == periodo && r.mesa == m) {
                        ocupada = true;
                        break;
                    }
                }
                if(!ocupada) {
                    mesasCandidatas.add(m);
                }
            }
        }

        Mesa mesaEscolhida = this.politica.selecionarMesa(mesasCandidatas, qtdPessoas, local, periodo);

        if (mesaEscolhida != null) {
            Reserva reservaConfirmada = new Reserva(
                cliente, this.restaurante, mesaEscolhida, qtdPessoas.getNumeroPessoas(), 
                periodo.toString(), 'CONFIRMADA', local.getLocal().toString()
            );
            
            this.restaurante.registrarReserva(reservaConfirmada);
            return reservaConfirmada;
            
        } else {
            if (!aceitaListaEspera) {
                System.debug('Sem mesas disponíveis e cliente não aceita lista de espera.');
                return null;
            }
            
            Reserva reservaEspera = new Reserva(
                cliente, this.restaurante, null, qtdPessoas.getNumeroPessoas(), 
                periodo.toString(), 'PENDENTE', local.getLocal().toString()
            );
            
            this.restaurante.registrarReserva(reservaEspera);
            return reservaEspera;
        }
    }

    public void cancelarReserva(Reserva reserva) {
        reserva.sRestaurante = StatusReserva.sReserva.CANCELADA;
        Mesa mesaLiberada = reserva.mesa;
        Integer indiceReservaPromovida = null;

        if (mesaLiberada != null) {
            for (Integer i = 0; i < this.restaurante.listaEspera.size(); i++) {
                Reserva r = this.restaurante.listaEspera.get(i);
                
                if (r.sRestaurante == StatusReserva.sReserva.PENDENTE &&
                    r.rRestaurante == reserva.rRestaurante &&
                    r.localPreferencia == String.valueOf(mesaLiberada.local) &&
                    r.quantidadePessoas <= mesaLiberada.capacidade) {
                    
                    r.sRestaurante = StatusReserva.sReserva.CONFIRMADA;
                    r.mesa = mesaLiberada;
                    
                    this.restaurante.registrarReserva(r);
                    indiceReservaPromovida = i;
                    break;
                }
            }

            if (indiceReservaPromovida != null) {
                this.restaurante.listaEspera.remove(indiceReservaPromovida);
            }
        }
    }

    public List<Reserva> listarReservasCliente(Documento documentoCliente) {
        List<Reserva> reservasDoCliente = new List<Reserva>();
        
        for (Reserva r : this.restaurante.Reserva) {
            if (r.cliente != null && r.cliente.equals(documentoCliente)) {
                reservasDoCliente.add(r);
            }
        }
        
        for (Reserva r : this.restaurante.listaEspera) {
            if (r.cliente != null && r.cliente.equals(documentoCliente)) {
                reservasDoCliente.add(r);
            }
        }
        
        return reservasDoCliente;
    }
}