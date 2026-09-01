public Boolean companionPlants(String plant1, String plant2) {
    String let = 'lettuce';
    String cu = 'cucumbers';
    String oni = 'onions';
    String ca = 'carrots';
    String to = 'tomatoes';
    if(plant1 == let && plant2 == cu || plant1 == cu && plant2 == let){
        return true;
    }
    else if(plant1 == let && plant2 == oni || plant1 == oni && plant2 == let){
        return true;
    }
    else if(plant1 == oni && plant2 == ca || plant1 == ca && plant2 == oni){
        return true;
    }
    else if(plant1 == oni && plant2 == to || plant1 == to && plant2 == oni){
        return true;
    }
    return false;
}