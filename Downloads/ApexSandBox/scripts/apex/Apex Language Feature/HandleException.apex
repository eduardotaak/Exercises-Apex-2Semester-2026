public String divide(Integer a, Integer b){
    try{
        return String.valueOf(a/b);
    }catch(Exception e){
        return e.getMessage();
    }
}