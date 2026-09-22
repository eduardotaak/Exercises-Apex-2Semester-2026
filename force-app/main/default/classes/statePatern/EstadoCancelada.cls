public class EstadoCancelada extends EstadoReserva{
    public EstadoCancelada(String reserva) {
        super(reserva);
    }

    public override void cancelar(){
        this.reserva = 'CANCELADA';
    }

    public override void promover(){
    }

    public override void confirmar(){
    }
}