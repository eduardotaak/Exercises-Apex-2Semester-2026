public static Integer findLast(List<Integer> nums, Integer target) {
    Integer ultimaOcorrencia = -1;
    for(Integer i = nums.size() - 1; i>=0 ;i--){
        if(nums[i] == target){
            ultimaOcorrencia = i;
            break;
        }
    }
    return ultimaOcorrencia;
}