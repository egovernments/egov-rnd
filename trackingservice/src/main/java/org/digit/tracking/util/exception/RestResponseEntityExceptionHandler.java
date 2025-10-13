package org.digit.tracking.util.exception;

import org.digit.tracking.util.Constants;
import org.digit.tracking.util.JsonUtil;
import org.digit.tracking.util.TrackingApiUtil;
import org.openapitools.model.ACK;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

//HTTP response handler for managed exceptions in the application
@ControllerAdvice
public class RestResponseEntityExceptionHandler
        extends ResponseEntityExceptionHandler {

    @ExceptionHandler(value
            = { FsmInvalidTokenException.class })
    protected ResponseEntity<Object> handleConflict(
            RuntimeException ex, WebRequest request) {
        ACK ack = new ACK();
        ack.setId("");
        ack.setResponseCode("CODE-003");
        ack.setResponseMessage(ex.getMessage());
        String bodyOfResponse = JsonUtil.getJsonFromObject(ack);
        return handleExceptionInternal(ex, bodyOfResponse,
                new HttpHeaders(), HttpStatus.UNAUTHORIZED, request);
    }
}