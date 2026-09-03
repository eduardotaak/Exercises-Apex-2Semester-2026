public List<Integer> evenNumbers(Integer n) {
    Integer num = 0;
    List<Integer> numbers = new List<Integer>();
    for(Integer i = 0; i < n; i++){
        num += 2;
        numbers.add(num);
    }
    return numbers;
}