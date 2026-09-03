public Integer findTargetCount(List<Integer> nums, Integer target) {
    Integer contador = 0;
    for(Integer i = 0; i <  nums.size(); i++){
        if(nums[i] == target){
            contador++;
        }
    }

    if(contador == 0){
        return 0;
    }else{
        return contador;
    }
}