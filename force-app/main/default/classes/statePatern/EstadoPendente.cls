public class EstadoPendente extends EstadoReserva{
    public EstadoPendente(String reserva) {
        super(reserva);
    }
    public override void confirmar(){}

    public override void promover(){
        this.reserva = 'PROMOVIDA';
    }

    public override void cancelar(){
        this.reserva = 'CANCELADA';
    }
}