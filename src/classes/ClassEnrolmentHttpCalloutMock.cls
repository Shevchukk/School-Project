@IsTest
global class ClassEnrolmentHttpCalloutMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"success":"true"}');
        response.setStatusCode(200);
        return response;
    }

}