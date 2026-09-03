public Integer maxConsecutiveOnes(Integer[] numbers) {
    Integer uns = 0;
    Integer unsSeguidos = 0;
    for(Integer numero : numbers){
        if(numero == 1){
            uns++;
            if(uns >= unsSeguidos){
                unsSeguidos = uns;
            }
        }
        if(numero == 0){
            uns = 0;
        }
    }
    return unsSeguidos;
}