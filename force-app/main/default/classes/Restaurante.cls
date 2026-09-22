public class Restaurante {
    public String nome {get; private set;}
    public String endereco {get; private set;}
    public List<Mesa> Mesa {get; private set;}
    public List<Reserva> Reserva {get; private set;}
    public List<Reserva> listaEspera {get; private set;}
    private Set<Integer> numeroOcupadoMesas {get; set;}

    public Restaurante(String restauranteNome, String restauranteEndereco){
        this.nome = restauranteNome;
        this.endereco = restauranteEndereco;
        this.numeroOcupadoMesas = new Set<Integer>();
        this.Mesa = new List<Mesa>();
        this.Reserva = new List<Reserva>();
        this.listaEspera = new List<Reserva>();
    }

    public void registrarReserva(Reserva newReserva){
        if(newReserva.sRestaurante == StatusReserva.sReserva.PENDENTE && newReserva.mesa != null){
            throw new IllegalArgumentException('Reserva pendente nao pode ser confirmada');
        }

        if(newReserva.sRestaurante == StatusReserva.sReserva.CONFIRMADA && newReserva.mesa == null){
            throw new IllegalArgumentException('Reserva precisa de uma mesa');
        }

        if (newReserva.sRestaurante == StatusReserva.sReserva.CONFIRMADA) {
            for (Reserva r : this.Reserva) {
                if (r.sRestaurante == StatusReserva.sReserva.CONFIRMADA && 
                    r.rRestaurante == newReserva.rRestaurante && 
                    r.mesa == newReserva.mesa) {
                    
                    throw new IllegalArgumentException('Mesa ja confirmada nesse periodo!');
                }
            }
            this.Reserva.add(newReserva);
        } else if(newReserva.sRestaurante == StatusReserva.sReserva.PENDENTE){
            this.listaEspera.add(newReserva);
        }
    }

    public void adicionarMesa(Mesa mesa){
        if(mesa != null && mesa.capacidade > 0){
            if(!numeroOcupadoMesas.contains(mesa.numero.getNumeroMesa())){
                this.Mesa.add(mesa);
                numeroOcupadoMesas.add(mesa.numero.getNumeroMesa());
            } else {
                System.debug('Mesa ja ocupadas!');
            }
        }
    }

    public void adicionarMesa(IdentificadorMesa numero, Integer capacidade, String clienteMesa){
        if(capacidade > 0){
            if(!this.numeroOcupadoMesas.contains(numero.getNumeroMesa())){
                Mesa mesaNew = new Mesa(numero, capacidade, clienteMesa);
                this.Mesa.add(mesaNew);
                this.numeroOcupadoMesas.add(numero.getNumeroMesa());
            } else {
                System.debug('Mesa ja ocupadas!');
            }
        }
    }
}