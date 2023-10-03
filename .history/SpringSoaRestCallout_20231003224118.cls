public with sharing class SpringSoaRestCallout {
    public static HttpResponse makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://www.yahoo.com');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            String getResponse = response.getBody();
            System.debug('Requested Response--->'+getResponse);
        }
        return response;
    }
}