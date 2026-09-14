public class StatusReserva {
        public enum sReserva{
        PENDENTE,
        CONFIRMADA,
        CANCELADA
    }

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