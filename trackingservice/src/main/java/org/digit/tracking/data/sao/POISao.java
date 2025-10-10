package org.digit.tracking.data.sao;

import org.digit.tracking.data.dao.PoiDao;
import org.digit.tracking.data.model.FsmApplication;
import org.digit.tracking.data.model.FsmVehicleTrip;
import org.digit.tracking.util.JsonUtil;
import org.openapitools.model.Location;
import org.openapitools.model.POI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//TripSao is the service access object to manage trip data operations (search, update). This SAO interacts with DIGIT FSM APIs
@Service
public class POISao {
    Logger logger = LoggerFactory.getLogger(POISao.class);

    @Autowired
    PoiDao poiDao;
    //Destination location POI id of a trip is from the FS treatment plant for the tenant id
    public String getDesitationLocation(String tenantId, String authToken, String mdmsUrl) {
        logger.info("## getDesitationLocation" );
        String poiIdDestination = "";
        //TODO - Since there destination to tenant mapping is evolving, we are using a fixed POI from database. This has to change to REST API call
        List<POI> poiList = poiDao.fetchPOIbyFilters("FSTP", null, tenantId);
        if (poiList.size() > 0) {
            //Fetch the first element in location since this ia POINT spatial with single part of LatLong
            poiIdDestination = poiList.get(0).getId();
        }
        return poiIdDestination;
    }
}
