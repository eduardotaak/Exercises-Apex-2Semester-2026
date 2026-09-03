public List<Integer> fibonacciSeries(Integer n) {
    List<Integer> fibonacci = new List<Integer>();
    Integer primeiro = 0;
    Integer segundo = 1;
    for(Integer i = 0; i < n; i++){
    Integer proximo = primeiro + segundo;
    primeiro = segundo;
    segundo = proximo;
    fibonacci.add(primeiro);
    }
    return fibonacci;
}