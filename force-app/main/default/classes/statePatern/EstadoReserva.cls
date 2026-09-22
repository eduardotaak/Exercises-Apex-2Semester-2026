public abstract class EstadoReserva {
    // acessada diretamente pelas classes abstratas a EstadoReserva
    protected String reserva;
    
    public EstadoReserva(String reserva) {
        this.reserva = reserva;
    }

    public abstract void confirmar();
    public abstract void cancelar();
    public abstract void promover();
}