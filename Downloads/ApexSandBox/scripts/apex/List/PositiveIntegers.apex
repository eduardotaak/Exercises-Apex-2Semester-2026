public List<Integer> positiveIntegers(List<Integer> numbers) {
    List<Integer> maioresZero = new List<Integer>();
    for(Integer num : numbers){
        if(num > 0){
            maioresZero.add(num);
        }
    }
    return maioresZero;
}