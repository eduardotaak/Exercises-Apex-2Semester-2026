public class Documento {

    private final String numero;
    public Documento(String numero) {
        this.numero = numero;
    }

    public String getNumero(){
        return this.numero;
    }


    // verifica se o objeto que foi passado é um Documento e compara o numero, caso sejam o mesmo numero ele retorna false
    public Boolean equals(Object obj){
        if(obj instanceof Documento){
            Documento c = (Documento) obj;
            return this.numero == c.numero;
        }
        return false;
    }
    // boa pratica que retorna o codigo integer hash da string
    public Integer hashCode(){
        return System.hashCode(this.numero);
    }
}