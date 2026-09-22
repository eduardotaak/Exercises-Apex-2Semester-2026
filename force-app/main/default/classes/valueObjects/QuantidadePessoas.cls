public class QuantidadePessoas {

    private final Integer qtdPessoas;

    public QuantidadePessoas(Integer qtdPessoas) {
        this.qtdPessoas = qtdPessoas;
    }

    public Integer getNumeroPessoas(){
        return this.qtdPessoas;
    }

    public Boolean equals(Object obj){
        if(obj instanceof QuantidadePessoas){
            QuantidadePessoas pessoa = (QuantidadePessoas) obj;
            return this.qtdPessoas == pessoa.qtdPessoas;
        }
        return false;
    }
    // verifica se eh igual ou menor que zero
    public Boolean isZero(){
        if(this.qtdPessoas <= 0){
            return true;
        }
        return false;
    }


    // verifica utilizando o metodo acima, se for 0 <=  retorna -1 ; retorna 1
    public Integer numPessoas(){
        if(isZero()){
            return -1;
        }
        return 1;
    }

    public Integer hashCode(){
        return System.hashCode(this.qtdPessoas);
    }
}