public Integer sumToN(Integer n) {
    Integer soma = 0;
    for(Integer num = n; num >= 1; num--){
        soma += num;
    }
    return soma;
}