public class EstadoConfirmada extends EstadoReserva{
    public EstadoConfirmada(String reserva) {
        super(reserva);
    }
    public override void confirmar(){
        this.reserva = 'CONFIRMADA';
    }

    public override void promover(){
    }

    public override void cancelar(){
        this.reserva = 'CANCELADA';
    }
}