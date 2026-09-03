public void insertAtStart(String cityName, List<String> cities) {
    if(cities.size() == 0){
        cities.add(cityName);
    }else{
    cities.add(0, cityName);  
}
}