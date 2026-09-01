public String whichTwo(Integer a, Integer b, Integer c) {
    String texto = '';
    if(a + b == c){
        texto = 'c';
    }
    if(a + c == b){
        texto =  'b';
    }
    if(b+c == a){
        texto = 'a';
    }
    return texto;
}