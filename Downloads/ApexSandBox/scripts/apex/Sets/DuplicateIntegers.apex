public Boolean containsDuplicates(List<Integer> nums) {
    boolean duplicate = false;

    Set<Integer> sContains = new Set<Integer>();

    for(Integer num : nums){
        if(sContains.contains(num)){
            duplicate = true;
        }
        else{
            sContains.add(num);
        }
    }
    return duplicate;
}