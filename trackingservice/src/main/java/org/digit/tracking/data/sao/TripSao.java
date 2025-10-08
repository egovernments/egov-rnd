package org.digit.tracking.data.sao;

import org.digit.tracking.data.model.FsmApplication;
import org.digit.tracking.data.model.FsmVehicleTrip;
import org.digit.tracking.util.Constants;
import org.digit.tracking.util.JsonUtil;
import org.digit.tracking.util.SaoUtil;
import org.digit.tracking.util.exception.RestTemplateResponseErrorHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.digit.tracking.util.exception.FsmInvalidTokenException;

import java.util.*;

//TripSao is the service access object to manage trip data operations (search, update). This SAO interacts with DIGIT FSM APIs
@Service
public class TripSao {
    Logger logger = LoggerFactory.getLogger(TripSao.class);
    RestTemplate restTemplate = new RestTemplate();
    RestTemplateBuilder restTemplateBuilder = new RestTemplateBuilder();
    @Autowired
    public TripSao() {
        this.restTemplate = this.restTemplateBuilder
                .errorHandler(new RestTemplateResponseErrorHandler())
                .build();
        this.restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());

    }

    public List<FsmApplication> searchFsmApplicationsForDriver(String driverId, String tenantId, String authToken, String fsmUrl) {
        logger.info("## searchFsmApplicationsForDriver is invoked");
        List<FsmApplication> fsmApplicationList = new ArrayList<>();

        HttpEntity<Map<String, Object>> entity = SaoUtil.getMapHttpEntity(authToken, null);
        StringBuilder searchUrl = new StringBuilder().append(fsmUrl).append("/").append("_search?tenantId=").append(tenantId);
        if(driverId != null) {
            searchUrl.append("&driverId=").append(driverId);
        }
        logger.info("## " + searchUrl);

        ResponseEntity<String> response = restTemplate.postForEntity(searchUrl.toString(), entity, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            logger.info(response.getBody());
            fsmApplicationList = JsonUtil.getFSMObjectFromJson(response.getBody());
        } else {
            logger.error("## Request Failed");
            logger.error(response.getStatusCode().toString());
            logger.error(response.getBody());
            //In case the issue is due to invalid auth token, send a HTTP 401 so that client can retry with proper token
            if (Objects.requireNonNull(response.getBody()).contains("InvalidAccessTokenException")) {
                throw new FsmInvalidTokenException("InvalidAccessTokenException");
            }
        }
        return fsmApplicationList;
    }

    public String fetchFsmTrips(String referenceApplicationNo, String tripId, String tenantId, String authToken, String vehicleTripUrl) {
        logger.info("## fetchFsmTripsForApplication is invoked");
        HttpEntity<Map<String, Object>> entity = SaoUtil.getMapHttpEntity(authToken, null);
        StringBuilder searchUrl = new StringBuilder().append(vehicleTripUrl).append("/").append("_search?tenantId=").append(tenantId).append("&applicationStatus=").append(Constants.FSM_TRIP_SEARCH_STATUS_FILTER);
        if (referenceApplicationNo != null) {
            searchUrl.append("&refernceNos=").append(referenceApplicationNo);
        }
        if (tripId != null) {
            searchUrl.append("&applicationNos=").append(tripId);
        }

        logger.info("## " + searchUrl);

        ResponseEntity<String> response = restTemplate.postForEntity(searchUrl.toString(), entity, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            logger.info(response.getBody());
            return response.getBody();
        } else {
            logger.error("## Request Failed");
            logger.error(response.getStatusCode().toString());
            logger.error(response.getBody());
            //In case the issue is due to invalid auth token, send a HTTP 401 so that client can retry with proper token
            if (Objects.requireNonNull(response.getBody()).contains("InvalidAccessTokenException")) {
                throw new FsmInvalidTokenException("InvalidAccessTokenException");
            }
            return null;
        }
    }

    //Update vehicle trip status in FSM
    public List<FsmVehicleTrip> updateFsmEndTripForApplication(Map<String, Object> vehicleTripMap, String authToken, String vehicleTripUrl) {
        logger.info("## updateFsmEndTripForApplication ");
        List<FsmVehicleTrip> fsmVehicleTripList = new ArrayList<>();

        //Create http header and request body
        HttpEntity<Map<String, Object>> entity = SaoUtil.getMapHttpEntity(authToken, vehicleTripMap);

        StringBuilder updateUrl = new StringBuilder().append(vehicleTripUrl).append("/").append("_update?_=1698562201046");
        logger.info("## " + updateUrl);

        ResponseEntity<String> response = restTemplate.postForEntity(updateUrl.toString(), entity, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            logger.info(response.getBody());
            fsmVehicleTripList = JsonUtil.getFSMVehicleTripObjectFromJson(response.getBody());
        } else {
            logger.error("## Request Failed");
            logger.error(response.getStatusCode().toString());
            logger.error(response.getBody());
            //In case the issue is due to invalid auth token, send a HTTP 401 so that client can retry with proper token
            if (Objects.requireNonNull(response.getBody()).contains("InvalidAccessTokenException")) {
                throw new FsmInvalidTokenException("InvalidAccessTokenException");
            }
        }
        return fsmVehicleTripList;
    }
}
