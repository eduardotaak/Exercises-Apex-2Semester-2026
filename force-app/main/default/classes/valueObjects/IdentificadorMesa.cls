public class IdentificadorMesa {
    private final Integer numMesa;

    public IdentificadorMesa(Integer numMesa) {
        this.numMesa = numMesa;
    }
    
    public Integer getNumeroMesa(){
        return this.numMesa;
    }

    public Boolean equals(Object obj){
        if(obj instanceof IdentificadorMesa){
            IdentificadorMesa identificarMesa = (IdentificadorMesa) obj;
            return this.numMesa == identificarMesa.numMesa;
        }
        return false;
    }

    public Boolean ehIgual(Mesa mesa){
        if(mesa == null) return false;
        return this.numMesa.equals(mesa.numero);
    }

    public Integer hashCode(){
        return System.hashCode(this.numMesa);
    }
}