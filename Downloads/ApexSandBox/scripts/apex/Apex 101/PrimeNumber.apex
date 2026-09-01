public Boolean isPrime(Integer num) {
    Integer soma = 0;
    for(Integer i = num; i >= 1; i--){
        if(Math.mod(num, i) == 0){
            soma++;
        }
    }
    if(soma == 2){
        return true;
    }
    return false;
}