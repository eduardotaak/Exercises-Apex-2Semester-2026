public List<String> getFieldsValue(Account acc, List<String> fields){
List<String> campos = new List<String>();
for(String campo : fields){
        campos.add(String.valueOf(acc.get(campo)));
    }
    return campos;
}