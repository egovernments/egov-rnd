package org.digit.tracking.service;

import org.digit.tracking.data.dao.PoiDao;
import org.digit.tracking.data.dao.TripDao;
import org.digit.tracking.data.dao.TripProgressDao;
import org.digit.tracking.data.model.FsmApplication;
import org.digit.tracking.data.model.FsmVehicleTrip;
import org.digit.tracking.data.sao.TripSao;
import org.digit.tracking.monitoring.RuleEngine;
import org.digit.tracking.service.helper.TripServiceHelper;
import org.digit.tracking.util.Constants;
import org.digit.tracking.util.ConverterUtil;
import org.digit.tracking.util.JsonUtil;
import org.openapitools.model.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TripService {
    @Autowired
    TripDao tripDao;
    @Autowired
    PoiDao poiDao;

    @Autowired
    TripProgressDao tripProgressDao;

    @Autowired
    TripSao tripSao;

    @Autowired
    TripServiceHelper tripServiceHelper;

    @Autowired
    RuleEngine ruleEngine;
    Logger logger = LoggerFactory.getLogger(TripService.class);


    //Fetch trips from FSM application
    public List<Trip> getFsmTripsForDriver(String driverId, String authToken, String tenantId) {
        logger.info("## getFsmTripsForDriver is invoked");
        //Step 1 - Fetch from FSM the list of applications based on driver id
        List<FsmApplication> fsmApplicationList = tripSao.searchFsmApplicationsForDriver(driverId, tenantId, authToken, Constants.DIGIT_FSM_URL);

        //Step 2 - Fetch from FSM list of trips mapped to each application
        //TODO Switch to passing multiple application nos to target API
        for (FsmApplication fsmApplication : fsmApplicationList) {
            //Fetch the trip list for the application and add list back to the main applications list

            String tripResponseJson = tripSao.fetchFsmTrips(
                    fsmApplication.getApplicationNo(), null, tenantId, authToken, Constants.DIGIT_VEHICLE_TRIP_URL);
            fsmApplication.setFsmVehicleTripList(JsonUtil.getFSMVehicleTripObjectFromJson(tripResponseJson));
        }

        //TODO - Can use a common Trip entity in future
        //Step 3 - Map to vehicle tracking Trip entity
        List<Trip> tripList = new ArrayList<>();
        for (FsmApplication fsmApplication : fsmApplicationList) {
            for (FsmVehicleTrip fsmVehicleTrip : fsmApplication.getFsmVehicleTripList()) {
                Trip trip = new Trip();

                String tripId = fsmVehicleTrip.getTripApplicationNo();
                trip.setId(tripId);
                trip.tenantId(tenantId);
                trip.setReferenceNo(fsmApplication.getApplicationNo());
                trip.setServiceCode(fsmVehicleTrip.getBusinessService());
                trip.setCitizen(fsmApplication.getCitizen());
                trip.setPickupLocation(ConverterUtil.addressToString(fsmApplication.getPickupAddress()));
                trip.setPlannedStartTime(fsmVehicleTrip.getTripStartTime());
                trip.setVehicle(fsmVehicleTrip.getVehicle());

                //Drop location is the FSTP location for that tenant id. Partial search on location name is performed
                //TODO - This can be cached as data rarely changes
                List<POI> poiList = poiDao.fetchPOIbyFilters("FSTP", null, tenantId);
                if (poiList !=null && !poiList.isEmpty()) {
                    POI endPoi = poiList.get(0);
                    trip.setDropLocation(endPoi.getLocationName());
                } else {
                    trip.setDropLocation("");
                }
                trip.setOperator(fsmVehicleTrip.getOperator());

                //Check if trip exists in VTS database. Insert it if it is not available locally. If already exists, fetch the status from VTS
                Trip vtsTrip = tripDao.fetchTripbyId(tripId);
                if (vtsTrip == null){
                    tripServiceHelper.createTripWithFsmData(tripId, tenantId, trip.getReferenceNo(),
                            Float.valueOf(fsmApplication.getPickupLocationLatitude()), Float.valueOf(fsmApplication.getPickupLocationLongitude()),
                            trip.getServiceCode(), trip.getPlannedStartTime());
                } else {
                    //Since trip already exists in VTS, use status from here since the mobile app understands VTS trip status
                    trip.setStatus(vtsTrip.getStatus());
                }
                //Add each trip to the main list
                tripList.add(trip);
            }
        }
        return tripList;
    }

    public List<Trip> getTripsByLocalSearch(String status, String userId, String operatorId, String tenantId, String businessService, String refernceNos) {
        return tripDao.fetchTripbyFilters(status, userId, operatorId, tenantId, businessService, refernceNos);
    }

    public Trip getTripById(String id) {
        return tripDao.fetchTripbyId(id);
    }

    public String createdTrip(Trip trip) {
        return tripDao.createTrip(trip);
    }

    //Update function to manage both VTS and FSM trip status updates
    public String updateTrip(Trip trip, String authToken) {

        if (trip.getStatus() == Trip.StatusEnum.COMPLETED) {
            trip.setTripEndType(Constants.TRIP_CLOSE_DRIVER);
            //Step 1 - Update trip status in FSM vehicle trip application
            tripServiceHelper.updateFSMTripStatus(trip, authToken, tripSao);
        }

        //Step 2 - Update trip status in vehicle tracking application
        String tripId =  tripDao.updateTrip(trip);

        //Final - Return trip id of the updated trip to the client
        return tripId;
    }

    public String createTripProgress(TripProgress tripProgress, String authToken) {

        //Usually the API receives only one location update. But in case the client app comes back from offline more, there could be bulk updates in a single json
        //progressTime is the time when the actual geo position was recorded
        //progressReportedTime is when the device reported this data to the tracking service (especially useful in case of bulk updates)
        for (TripProgressProgressDataInner tripProgressProgressDataInner : tripProgress.getProgressData()) {
            String progressId = tripProgressDao.createTripProgress(tripProgressProgressDataInner.getLocation(), tripProgress.getProgressReportedTime(),
                    tripProgressProgressDataInner.getProgressTime(), tripProgress.getTripId(), tripProgress.getUserId());
            //TODO - Remove this call once monitoring service is live
            ruleEngine.executeAllRules(progressId, authToken);
        }
        return tripProgress.getTripId();
    }

    public String updateTripProgress(String tripProgressId, String userId, String matchedPoiId) {
        return tripProgressDao.updateTripProgress(tripProgressId, userId, matchedPoiId);
    }

    public List<TripProgressResponse> getTripProgressById(String progressId, String tripId) {

        List<TripProgressResponse> tripProgressResponseList = tripProgressDao.getTripProgress(progressId, tripId);

        //Trip progress id alone is passed in this case
        return tripProgressResponseList;
    }
}

