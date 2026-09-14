public class LocalMesa {
    public enum LocalCliente{
        SALAO, JARDIM
    }

    public static LocalCliente validacao(String s){
        if(String.isBlank(s)){
            return null;
        }

        try{
            return LocalCliente.valueOf(s.toUpperCase().trim());
        }catch(Exception e){
            return null;
        }
    }
}