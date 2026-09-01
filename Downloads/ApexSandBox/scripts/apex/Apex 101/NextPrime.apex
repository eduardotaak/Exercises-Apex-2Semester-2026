public Integer nextPrime(Integer num) {
    if(num < 0){
        return 2;
    }
    num++;
    for(; !isPrime(num); num++){
    }
    return num;

}

public Boolean isPrime(Integer num) {
    for(Integer i = 2; i < num ; i++){
        if(Math.mod(num, i) == 0){
            return false;
        }
    }
    return true;
}