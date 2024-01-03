package org.digit.tracking.util.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.client.ResponseErrorHandler;

import java.io.IOException;

import static org.springframework.http.HttpStatus.Series.CLIENT_ERROR;
import static org.springframework.http.HttpStatus.Series.SERVER_ERROR;

//Common error handling component for Spring RestTemplate
@Component
public class RestTemplateResponseErrorHandler
        implements ResponseErrorHandler {

    Logger logger = LoggerFactory.getLogger(RestTemplateResponseErrorHandler.class);

    @Override
    public boolean hasError(ClientHttpResponse httpResponse)
            throws IOException {
        return (
                httpResponse.getStatusCode().series() == CLIENT_ERROR
                        || httpResponse.getStatusCode().series() == SERVER_ERROR);
    }

    //No specific implementation but this ensures the flow not exception out
    @Override
    public void handleError(ClientHttpResponse httpResponse)
            throws IOException {
        if (httpResponse.getStatusCode()
                .series() == HttpStatus.Series.SERVER_ERROR) {

            // handle SERVER_ERROR
        } else if (httpResponse.getStatusCode()
                .series() == HttpStatus.Series.CLIENT_ERROR) {
            // handle CLIENT_ERROR
            }
        }
    }