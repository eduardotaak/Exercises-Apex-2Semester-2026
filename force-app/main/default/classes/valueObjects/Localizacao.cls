public class Localizacao {
    private final LocalMesa.LocalCliente local;

    public Localizacao(LocalMesa.LocalCliente local){
        this.local = local;
    }

    public LocalMesa.LocalCliente getLocal(){
        return this.local;
    }

    public Boolean equals(Object obj){
        if(obj instanceof Localizacao){
            Localizacao lcl = (Localizacao) obj;
            return this.local == lcl.local;
        }
        return false;
    }
    
    public integer hashCode(){
        return System.hashCode(this.local);
    }
}