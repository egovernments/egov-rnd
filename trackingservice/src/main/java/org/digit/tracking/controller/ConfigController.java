package org.digit.tracking.controller;

import org.digit.tracking.service.ConfigService;
import org.digit.tracking.util.JsonUtil;
import org.digit.tracking.util.TrackingApiUtil;
import org.openapitools.api.ConfigApi;
import org.openapitools.model.LocationAlert;
import org.openapitools.model.ServiceType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.NativeWebRequest;

import javax.annotation.Generated;
import java.util.List;
import java.util.Optional;

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-07-29T17:17:16.820768500+05:30[Asia/Calcutta]")
@Controller
@RequestMapping("${openapi.trackingService.base-path:/api/v3}")
@CrossOrigin(maxAge = 3600)
public class ConfigController implements ConfigApi {

    Logger logger = LoggerFactory.getLogger(ConfigController.class);

    private final NativeWebRequest request;

    @Autowired
    public ConfigController(NativeWebRequest request) {
        this.request = request;
    }

    @Autowired
    ConfigService configService;

    @Override
    public Optional<NativeWebRequest> getRequest() {
        return Optional.ofNullable(request);
    }

    @Override
    public ResponseEntity<List<LocationAlert>> findAlerts(){
        logger.info("## findAlerts inside ConfigApiController");

        List<LocationAlert> alerts = configService.getLocationAlerts();
        TrackingApiUtil.setResponse(request, JsonUtil.getJsonFromObject(alerts));
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @Override
    public ResponseEntity<List<ServiceType>> findServices(){
        logger.info("## findTripService is invoked");

        List<ServiceType> services = configService.getServiceTypes();
        TrackingApiUtil.setResponse(request, JsonUtil.getJsonFromObject(services));
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
