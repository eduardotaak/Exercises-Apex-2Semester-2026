public class LocalMesa {
    public enum LocalCliente{
        SALAO, JARDIM
    }

    //recebe uma string e devolve um e um
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