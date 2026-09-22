public class PeriodoReserva {
    public enum pReserva{
        MANHA,
        TARDE,
        NOITE
    }

    // recebe uma string e devolve um enum
    public static pReserva validacao(String s){
        if(String.isBlank(s)){
            return null;
        }
        try{
            return pReserva.valueOf(s.toUpperCase().trim());
        }catch(Exception e){
            return null;
        }
    }

}
