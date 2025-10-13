package org.digit.tracking.service.helper;

import org.digit.tracking.data.dao.PoiDao;
import org.digit.tracking.data.dao.RouteDao;
import org.digit.tracking.data.dao.TripDao;
import org.digit.tracking.data.sao.POISao;
import org.digit.tracking.data.sao.TripSao;
import org.digit.tracking.util.Constants;
import org.digit.tracking.util.JsonUtil;
import org.openapitools.model.Location;
import org.openapitools.model.POI;
import org.openapitools.model.Route;
import org.openapitools.model.Trip;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//A helper class simplify logic in the trip service code
@Service
public class TripServiceHelper {

    Logger logger = LoggerFactory.getLogger(TripServiceHelper.class);
    @Autowired
    PoiDao poiDao;

    @Autowired
    RouteDao routeDao;

    @Autowired
    TripDao tripDao;

    @Autowired
    POISao poiSao;

    //Orchestrate creation of a new trip, which includes creates start and end POIs, route id and finally the trip in VTS
    public void createTripWithFsmData(String tripId, String tenantId, String referenceNo,
                                       Float latitude, Float longitude, String serviceCode, String startTime) {
        //Step 1 - Start POI id is provided as input in FSM response
        String startPoiId = createPOI(latitude, longitude);
        logger.info("## startPoiId " + startPoiId);
        //Step 2 - End POI should be fetched from another service of FSM
        String endPoiId = poiSao.getDesitationLocation(tenantId, null, null);
        logger.info("## endPoiId " + endPoiId);
        //Step 3 - Create route for the start and end POI combination
        String routeId = createRoute(startPoiId, endPoiId);
        logger.info("## routeId " + routeId);
        //Step 4 - Create trip
        String tripIdLocal = createTrip(tripId, referenceNo, tenantId, serviceCode, routeId, startTime);
        logger.info("## tripId " + tripId);
    }

    private String createPOI(Float latitude, Float longitude) {
        POI poi = new POI();
        List<Location> locationList = new ArrayList<>();
        Location location = new Location();
        location.setLatitude(latitude);
        location.setLongitude(longitude);
        locationList.add(location);
        poi.setLocationDetails(locationList);
        poi.setType(POI.TypeEnum.POINT);
        poi.setStatus(POI.StatusEnum.ACTIVE);
        //TODO - Pickup location name can be set to something else
        poi.locationName("");

        return poiDao.createPOI(poi);
    }

    private String createRoute(String startPoi, String endPoi) {
        Route route = new Route();
        route.setStatus(Route.StatusEnum.ACTIVE);
        route.setStartPoi(startPoi);
        route.endPoi(endPoi);
        return routeDao.createRoute(route);
    }

    private String createTrip(String tripId, String referenceNo, String tenantId, String serviceCode, String routeId, String startTime) {
        Trip trip = new Trip();
        trip.setId(tripId);
        trip.setReferenceNo(referenceNo);
        trip.setServiceCode(serviceCode);
        trip.setTenantId(tenantId);
        trip.setRouteId(routeId);
        trip.setPlannedStartTime(startTime);
        trip.setStatus(Trip.StatusEnum.NOTSTARTED);

        return tripDao.createTrip(trip);
    }

    public void updateFSMTripStatus(Trip trip, String authToken, TripSao tripSao) {
        String tripResponseJson = tripSao.fetchFsmTrips(
                null, trip.getId(), trip.getTenantId(), authToken, Constants.DIGIT_VEHICLE_TRIP_URL);

        //Step 2.2 - Update FSM vehicle trip map entity
        Map<String, Object> updatedVehicleTrip = JsonUtil.updateFsmTripEndActionJson(tripResponseJson, trip.getTripEndType());

        //Step 2.3 - Call FSM vehicle trip API and update trip status
        tripSao.updateFsmEndTripForApplication(updatedVehicleTrip, authToken, Constants.DIGIT_VEHICLE_TRIP_URL);
    }

}
