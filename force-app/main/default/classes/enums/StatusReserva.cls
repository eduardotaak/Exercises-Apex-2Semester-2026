public class StatusReserva {
        public enum sReserva{
        PENDENTE,
        CONFIRMADA,
        CANCELADA
    }

    // recenbe uma string e devolve um enum
    public static sReserva validacao(String s){
        if(String.isBlank(s)){
            return null;
        }
        try{
            return sReserva.valueOf(s.toUpperCase().trim());
        }catch(Exception e){
            return null;
        }
    }
}