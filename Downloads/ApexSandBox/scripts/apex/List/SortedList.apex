public boolean isSorted(List<Integer> numbers) {
    //flag ascending and descending
    Boolean ascd = true;
    Boolean dscd = true;

    // caso a lista contenha menos que 3 ou esteja vazia
    if(numbers.size() == 0 || numbers.size()< 3){
        return true;
    }

    // caso todos os numeros da lista sejam iguais
    for(Integer num = 0; num < numbers.size()-1; num++){
        if(numbers[num] == numbers[num+1]){
            iguais;
            break;
        }
    }
    if(iguais){
        return true;
    }

    // ordem descendente
    if(dscd){
        for(Integer i = numbers.size()-1; i > 0; i--) {
            if(numbers[i] > numbers[i-1]){
                dscd = false;
            }
        }
    }

    // ordem ascendente
    if(ascd){
        for(Integer i = 0; i < numbers.size()-1; i++){
            if(numbers[i] > numbers[i+1]){
               ascd = false; 
            }
        }
    }
    return ascd || dscd;
}