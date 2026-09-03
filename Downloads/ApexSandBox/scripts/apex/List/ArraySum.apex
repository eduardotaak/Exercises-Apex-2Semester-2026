public static Integer arraySum(List<Integer> numbers) {
    Integer numeros = 0;
    if(numbers != null){
    for(Integer i = 0; i<numbers.size(); i++){
        numeros += numbers[i];
    }
}
    return numeros;
}