public Decimal average(List<Decimal> numbers){
    Decimal soma = 0; Decimal media = 0;
    Integer tamanho = numbers.size();
    for(Decimal num : numbers){
        soma += num;
    }
    media = soma / tamanho;
    return media.setscale(2);

}