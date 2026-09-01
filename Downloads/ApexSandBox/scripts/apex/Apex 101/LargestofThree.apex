public static Integer findLargest(Integer num1, Integer num2, Integer num3) {
	Integer maior = num1;
    if(num2 > maior){
        maior = num2;
    }
    if(num3 > maior){
        maior = num3;
    }
    return maior;
}