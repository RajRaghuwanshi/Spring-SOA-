global class PostManEchoRestCallout {
    global Static String getEchoResponse() {
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');  
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('BODY: ' + res.getBody());
        System.debug('STATUS:' + res.getStatus());
        System.debug('STATUS_CODE:' + res.getStatusCode());
        return res.getBody();
    }
}