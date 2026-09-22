public class Reserva {
    public Cliente cliente { get; private set; }
    public Restaurante restaurante { get; private set; }
    public Mesa mesa { get; set; }
    public Integer quantidadePessoas { get; private set; }
    public PeriodoReserva.pReserva rRestaurante { get; private set; }
    public StatusReserva.sReserva sRestaurante {get; set; }
    public String localPreferencia { get; private set; }
    public EstadoReserva estado { get; private set; }

    public Reserva(Cliente cliente, Restaurante restaurante, Mesa mesa, Integer quantidadePessoas, PeriodoReserva.pReserva periodo, StatusReserva.sReserva status , String statusIncial, String localPreferencia) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.mesa = mesa;
        this.quantidadePessoas = quantidadePessoas;
        this.rRestaurante = periodo;
        this.sRestaurante = status;
        this.localPreferencia = localPreferencia;
    }

    public Reserva(Cliente cliente, Restaurante restaurante, Mesa mesa, Integer quantidadePessoas, String periodoStr, String statusStr, String localPreferencia) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.mesa = mesa;
        this.quantidadePessoas = quantidadePessoas;
        this.rRestaurante = PeriodoReserva.validacao(periodoStr);
        this.localPreferencia = localPreferencia;
        
        if (statusStr == 'CONFIRMADA') {
            this.sRestaurante = StatusReserva.sReserva.CONFIRMADA;
        } else if (statusStr == 'PENDENTE') {
            this.sRestaurante = StatusReserva.sReserva.PENDENTE;
        } else {
            this.sRestaurante = StatusReserva.sReserva.CANCELADA;
        }
    }
}