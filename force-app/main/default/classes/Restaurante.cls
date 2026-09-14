public class Restaurante {
    // metodos
    public String nome {get; private set;}
    public String endereco {get; private set;}
    public List<Mesa> Mesa {get; private set;}
    public List<Reserva> Reserva {get; private set;}

    // construtor
    public Restaurante(String restauranteNome, String restauranteEndereco){
        this.nome = restauranteNome;
        this.endereco = restauranteEndereco;

        // instancia das lists
        this.Mesa = new List<Mesa>();
        this.Reserva = new List<Reserva>();
    }

    // adiciona uma escolha a mesa
    public void adicionarMesa(Mesa mesa){
        this.Mesa.add(mesa);
    }

    public void adicionarReserva(Reserva reserva){
        this.Reserva.add(reserva);
    }
}