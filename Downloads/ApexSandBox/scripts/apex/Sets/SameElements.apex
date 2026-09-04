public Boolean sameElements(List<Integer> nums1, List<Integer> nums2) {
    Set<Integer> s1 = new Set<Integer>(nums1);
    Set<Integer> s2 = new Set<Integer>(nums2);
    Boolean flag = false;

    //verifica se esta vazio
    if(nums1.isEmpty() && nums2.isEmpty()){
        return true;
    }

    if(s1.equals(s2)){
        flag = true;
    }
    
    return flag;
}