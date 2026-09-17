    public class Restaurante {
        // metodos
        public String nome {get; private set;}
        public String endereco {get; private set;}
        public List<Mesa> Mesa {get; private set;}
        public List<Reserva> Reserva {get; private set;}
        public List<Reserva> listaEspera {get; private set;}
        private Set<Integer> numeroOcupadoMesas {get; set;}



        // construtor da classe
        public Restaurante(String restauranteNome, String restauranteEndereco){
            this.nome = restauranteNome;
            this.endereco = restauranteEndereco;
            this.numeroOcupadoMesas = new Set<Integer>();
            this.Mesa = new List<Mesa>();
            this.Reserva = new List<Reserva>();
            this.listaEspera = new List<Reserva>();
        }



        // verifica a disponibilidade e caso possua adiciona e retorna
        public List<Mesa> buscarDisponibilidade(Integer quantidadePessoas, LocalMesa.LocalCliente local){
            List<Mesa> disponiveis = new List<Mesa>();

            for(Mesa m : this.Mesa){
                if(m.capacidade >= quantidadePessoas && m.local == local){
                    disponiveis.add(m);
                }
            }
            return disponiveis;
        }



        // adiciona a reserva
        public void adicionarReserva(Reserva reserva){
            this.Reserva.add(reserva);
        }

        // vai receber a instancia de mesa
        public void adicionarMesa(Mesa mesa){
            if(mesa != null && mesa.capacidade > 0){
                if(!this.numeroOcupadoMesas.contains(mesa.numero)){
                    this.Mesa.add(mesa);
                    this.numeroOcupadoMesas.add(mesa.numero);
                }else{
                    System.debug('Mesa ja ocupadas!');
                }
            }
        }



        // validacoes para adicionar a mesa
        public void adicionarMesa(Integer numero, Integer capacidade, String clienteMesa){
            if(capacidade > 0){
                if(!this.numeroOcupadoMesas.contains(numero)){
                    Mesa mesaNew = new Mesa(numero, capacidade, clienteMesa);
                    this.Mesa.add(mesaNew);
                    this.numeroOcupadoMesas.add(numero);
                }else{
                    System.debug('Mesa ja ocupadas!');
                }
            }
        }



        public Reserva criarReserva(Cliente cliente, Integer quantidadePessoas, LocalMesa.LocalCliente localPreferido, PeriodoReserva.pReserva periodo, Boolean aceitaListaEspera){
            // busca uma mesa com a capacidade suficiente e no local solicitado pelo cliente (procurar pela
            // mesa mais adequada        
            List<Mesa> mesasDisponiveis = buscarDisponibilidade(quantidadePessoas, localPreferido);
            Mesa melhorMesa = null;

            for(Mesa m : mesasDisponiveis){
                Boolean flag = false;
                for(Reserva r : this.Reserva){
                if(r.sRestaurante == StatusReserva.sReserva.CONFIRMADA && r.rRestaurante == periodo && r.mesa == m){
                    flag = true;
                    break;
                }
            }

                if(!flag){
                    if(melhorMesa == null || m.capacidade <= melhorMesa.capacidade){
                        melhorMesa = m;
                    }
                }
                
            }

            if(melhorMesa == null){
                if(mesasDisponiveis.isEmpty()){
                    System.debug('Nao existe mesa com capacidade suficiente para essa quantidade de pessoas.');
                    return null;
                }
                if(!aceitaListaEspera){
                    System.debug('Nao existem mesas disponiveis agora.\nSem lista de espera');
                    return null;
                }

                Reserva reservaEspera = new Reserva(
                    cliente, this, null, quantidadePessoas, periodo.toString(), 'PENDENTE', localPreferido.toString()
                );
                this.listaEspera.add(reservaEspera);
                return reservaEspera;
            }

            // instancia para retornar a melhor reserva para determinado cliente conforme suas preferencias
            Reserva reservaCliente = new Reserva(
            cliente, this, melhorMesa, quantidadePessoas, periodo.toString(), 'CONFIRMADA', localPreferido.toString());

            adicionarReserva(reservaCliente);
            return reservaCliente;
        }
        public void cancelarReserva(Reserva reserva){
    reserva.sRestaurante = StatusReserva.sReserva.CANCELADA;

    Mesa mesaLiberada = reserva.mesa;
    Integer indiceReservaPromovida = null;

    for(Reserva r : this.listaEspera){

        if(
            r.sRestaurante == StatusReserva.sReserva.PENDENTE &&
            r.rRestaurante == reserva.rRestaurante &&
            r.localPreferencia == mesaLiberada.local &&
            r.quantidadePessoas <= mesaLiberada.capacidade
        ){
            r.sRestaurante = StatusReserva.sReserva.CONFIRMADA;
            r.mesa = mesaLiberada;

            adicionarReserva(r);

            indiceReservaPromovida = this.listaEspera.indexOf(r);
            break;
        }
    }

    if(indiceReservaPromovida != null){
        this.listaEspera.remove(indiceReservaPromovida);
    }
}
}