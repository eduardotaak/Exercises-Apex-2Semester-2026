public String aOrAn(String word) {
    String w = word.toLowerCase();
    if(w.startsWith('a') || w.startsWith('e') || w.startsWith('i')
    || w.startsWith('o') || w.startsWith('u')){
        return String.format('an {0}', new List<String>{w});
    }
    return String.format('a {0}', new List<String>{w});
}