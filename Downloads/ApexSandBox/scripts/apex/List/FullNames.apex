public List<String> fullNames(List<String> firstNames, List<String> lastNames) {
    List<String> nomeCompleto = new List<String>();
    for(Integer i = 0; i < firstNames.size(); i++){
        nomeCompleto.add(firstNames[i] + ' ' + lastNames[i]);
    }
    return nomeCompleto;
}