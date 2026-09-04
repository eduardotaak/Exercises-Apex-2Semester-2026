public Set<Integer> setIntersection(Set<Integer> set1, Set<Integer> set2) {
    Set<Integer> numerosComum = new Set<Integer>();

    for(Integer num : set1){
        for(Integer numb : set2){
            if(num == numb){
                numerosComum.add(numb);
            }
        }
    }
    return numerosComum;
}