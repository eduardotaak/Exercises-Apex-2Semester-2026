public String reverseWordsInASentence(String sentence){
    String resultado = '';
    if(sentence == null){
        return null;
    }
    List <String> frase = sentence.split(' ');
    List <String> fraseInvertida = new List <String>();


    for(Integer i = frase.size() - 1; i>=0; i--){
        fraseInvertida.add(frase[i]);
    }
    resultado = String.join(fraseInvertida, ' ');
    return resultado;
}