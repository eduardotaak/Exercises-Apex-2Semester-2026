public Integer secondLargest(List<Integer> numbers) {

    // inicializando a list e o set
    Set<Integer> secondSet = new Set<Integer>(numbers);
    List<Integer> second = new List<Integer>(secondSet);

    // inicializando as variaveis 
    Integer maior = second[0];
    Integer posicao;

    for(Integer i = 0; i < second.size(); i++){
        if(second[i] >= maior){
            maior = second[i];
            posicao = second.indexOf(maior);
        }
    }
    // removendo o maior
    second.remove(posicao);

    // procurando o segundo maior
    Integer segundoMaior = second[0];
    for(Integer i = 0; i < second.size(); i++){
        if(second[i] > segundoMaior){
            segundoMaior = second[i];
        }
    }
    return segundoMaior;
}