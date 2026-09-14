public class Mesa {
    public Integer numero;
    public Integer capacidade;
    public LocalMesa.LocalCliente local;
    
    public Mesa(Integer numero, Integer capacidade, String clienteMesa) {
        this.numero = numero;
        this.capacidade = capacidade;
        this.local = LocalMesa.validacao(clienteMesa);
    }
}