public class Reserva {
    public Cliente cliente;
    public Restaurante restaurante;
    public Mesa mesa = null;
    public Integer quantidadePessoas;
    public PeriodoReserva.pReserva rRestaurante;
    public StatusReserva.sReserva sRestaurante;
    public LocalMesa.LocalCliente localPreferencia;


    public Reserva(Cliente cliente, Restaurante restaurante, Mesa mesa, 
    Integer quantidadePessoas, String pReserva, String sReserva, String localPreferencia){
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.mesa = mesa;

        this.quantidadePessoas = quantidadePessoas;
        this.rRestaurante = PeriodoReserva.validacao(pReserva);
        this.sRestaurante = StatusReserva.validacao(sReserva);
        this.localPreferencia = LocalMesa.validacao(localPreferencia);
    }
}