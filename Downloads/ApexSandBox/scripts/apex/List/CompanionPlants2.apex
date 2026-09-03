public Boolean companionPlants(List<String> plants) {
    Boolean flag = false;
    if(plants.size() == 1){
        return flag;
    }
    if(plants.size() == 0){
        flag = true;
    }
    if(plants.size() != 0){
        for(Integer i = 0; i < (plants.size())-1; i++){
            if(plants[i] == 'lettuce' && (plants[i+1] == 'cucumbers' || plants[i+1] == 'onions')){
                flag = true;
            }
            else if(plants[i] == 'cucumbers' && plants[i+1] == 'lettuce'){
                flag = true;
            }
            else if(plants[i] == 'carrots' && plants[i+1] == 'onions'){
                flag = true;
            }
            else if(plants[i] == 'tomatoes' && plants[i+1] == 'onions'){
                flag = true;
            }
            else if(plants[i] == 'onions' && (plants[i+1] == 'lettuce' || plants[i+1] == 'carrots' || plants[i+1] == 'tomatoes')){
                flag = true;
            }
            else if(plants[i] == plants[i+1]){
                return false;
            }

            else{
                return false;
            }
        }
    }
    return flag;
}