public static Integer findLargest(List<Integer> nums) {
    Integer maior = nums[0];
	for(Integer i = 0; i < nums.size(); i++){
        if(nums[i] > maior){
            maior = nums[i];
        }
    }
    return maior;
}