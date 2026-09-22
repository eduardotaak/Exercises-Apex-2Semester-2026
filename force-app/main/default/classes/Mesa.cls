public class Mesa {
    public IdentificadorMesa numero;
    public Integer capacidade;
    public LocalMesa.LocalCliente local;
    
    public Mesa(IdentificadorMesa numero, Integer capacidade, String clienteMesa) {
        this.numero = numero;
        this.capacidade = capacidade;
        this.local = LocalMesa.validacao(clienteMesa);
    }
}

// classe mesa que guarda os atributos que uma mesa possui, nesse caso, numero da mesa, a sua capacidade e seu local se eh jardim ou salao