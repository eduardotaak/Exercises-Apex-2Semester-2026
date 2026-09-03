public List<String> orgNames(List<String> adjectives, List<String> animals) {
    List<String> combinations = new List<String>();
    for(String adjetivo : adjectives){
        for(String animais : animals){
            combinations.add(adjetivo + '-' + animais);
        }
    }
    return combinations;
}