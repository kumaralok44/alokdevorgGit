public class IbmStockPriceIntegration {
    @Future(callout=true)
    public static void ibmstock(){       
        Http http = New Http();
HttpRequest request = New HttpRequest();
request.setEndPoint('https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=SZ8BUDYZA0ROQIRU');
request.setMethod('GET');
HttpResponse response = http.send(request);
if(response.getStatusCode()==200){
    string body = response.getbody();
    System.debug(body);
}
else{
    System.debug('Request is not as per expecatation: '+response.getStatusCode() + ' : '+ response.getStatus());
    
}

    }

}