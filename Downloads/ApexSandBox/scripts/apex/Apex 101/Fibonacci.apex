public Integer fibonacci(Integer n) {
Integer primeiro = 0;
Integer segundo = 1;
for(Integer i = 0; i < n; i++){
    Integer proximo = primeiro + segundo;
    primeiro = segundo;
    segundo = proximo;
    }
return primeiro;
}