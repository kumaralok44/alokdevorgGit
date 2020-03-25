public class AnimalLocator {
    public static String getAnimalNameById(Integer idAsParam){
        String retval = Null;
        Http http = New Http();
        HttpRequest request = New HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals/'+idAsParam);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) json.deserializeUntyped(response.getBody());
            Map<String,Object> mapofanimals = (Map<String,Object>)results.get('animals');
            
            retval = string.valueOf(mapofanimals.get('name'));
        }
        return retval;
        
    }

}