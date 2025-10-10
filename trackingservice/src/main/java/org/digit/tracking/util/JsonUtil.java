package org.digit.tracking.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.digit.tracking.data.model.FsmApplication;
import org.digit.tracking.data.model.FsmVehicleTrip;
import org.openapitools.model.Address;
import org.openapitools.model.Citizen;
import org.openapitools.model.Location;
import org.openapitools.model.Vehicle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public class JsonUtil {
    static Logger logger = LoggerFactory.getLogger(JsonUtil.class);

    public static String getJsonFromObject(Object obj) {
        ObjectMapper converter = new ObjectMapper();
        converter.registerModule(new JavaTimeModule());
        try {
            return converter.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    //FSM entity data is required for vehicle tracking of FSM use cases. Application number and pickup coordinates are the most important ones
    public static List<FsmApplication> getFSMObjectFromJson(String jsonString) {
        Map<String, Object> result = getStringObjectMap(jsonString);

        //Fetch data in this json path - /fsm/address/geoLocation
        List<Object> listOfApplications = (List<Object>) result.get("fsm");
        List<FsmApplication> fsmApplicationList = new ArrayList<>();

        for (Object listOfApplication : listOfApplications) {
            FsmApplication fsmApplication = getFsmApplication((Map<String, Object>) listOfApplication);
            //Add to applications list
            fsmApplicationList.add(fsmApplication);
        }
        return fsmApplicationList;
    }

    //Identify location of FSTP
    public static Location getLocationObjectFromJson(String jsonString) {
        Map<String, Object> result = getStringObjectMap(jsonString);

        //TODO - Parsing JSON this way is not clean. Replace with better code.
        //Fetch data in this json path - /fsm/address/geoLocation
        Map<String, Object> mdm = (Map<String, Object>) result.get("MdmsRes");
        Map<String, Object> fsm = (Map<String, Object>) mdm.get("FSM");
        List<Object> plantList = (List<Object>) fsm.get("FSTPPlantInfo");

        //TODO - since FSM application currently does not provide destination, pick the first record. This will work for Odisha but will not be correct in future
        Map<String, String> plantMap = (Map<String, String>) plantList.get(0);

        Location location = new Location();
        location.setLatitude(Float.valueOf(plantMap.get("latitude")));
        location.setLongitude(Float.valueOf(plantMap.get("longitude")));

        return location;
    }

    public static List<FsmVehicleTrip> getFSMVehicleTripObjectFromJson(String jsonString) {
        Map<String, Object> result = getStringObjectMap(jsonString);
        DbUtil dbUtil = new DbUtil();

        //Fetch data in this json path - /vehicleTrip
        List<Object> listOfTrips = (List<Object>) result.get("vehicleTrip");

        List<FsmVehicleTrip> fsmVehicleTripList = new ArrayList<>();

        if (listOfTrips != null) {

            for (Object vehicleTrip : listOfTrips) {
                FsmVehicleTrip fsmVehicleTrip = new FsmVehicleTrip();
                Map<String, Object> mapOfVehicleTrip = (Map<String, Object>) vehicleTrip;

                fsmVehicleTrip.setTripApplicationNo(String.valueOf(mapOfVehicleTrip.get("applicationNo")));
                fsmVehicleTrip.setTripApplicationStatus(String.valueOf(mapOfVehicleTrip.get("applicationStatus")));
                fsmVehicleTrip.setBusinessService(String.valueOf(mapOfVehicleTrip.get("businessService")));

                Map<String, Object> mapOfAuditDetails = (Map<String, Object>) mapOfVehicleTrip.get("auditDetails");
                long epochStartTme = (long) mapOfAuditDetails.get("createdTime");
                fsmVehicleTrip.setTripStartTime(dbUtil.epochToDateFormat(epochStartTme));

                //Fetch vehicle details
                Map<String, Object> mapOfVehicle = (Map<String, Object>) mapOfVehicleTrip.get("vehicle");
                Vehicle vehicle = new Vehicle();
                vehicle.setRegistrationNumber(String.valueOf(mapOfVehicle.get("registrationNumber")));
                fsmVehicleTrip.setVehicle(vehicle);

                //Add to applications list
                fsmVehicleTripList.add(fsmVehicleTrip);
            }
        }
        return fsmVehicleTripList;
    }

    private static Map<String, Object> getStringObjectMap(String jsonString) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonObj;
        try {
            jsonObj = mapper.readTree(jsonString);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        Map<String, Object> result = mapper.convertValue(jsonObj, new TypeReference<Map<String, Object>>() {
        });
        return result;
    }

    private static FsmApplication getFsmApplication(Map<String, Object> listOfApplication) {
        FsmApplication fsmApplication = new FsmApplication();
        Map<String, Object> mapOfApplication = listOfApplication;
        Citizen citizen = new Citizen();
        Address pickupAddress = new Address();
        Address dropAddress = new Address();

        //Fetch application level attributes
        fsmApplication.setApplicationNo(String.valueOf(mapOfApplication.get("applicationNo")));
        fsmApplication.setApplicationStatus(String.valueOf(mapOfApplication.get("applicationStatus")));
        fsmApplication.setTenantId(String.valueOf(mapOfApplication.get("tenantId")));
        fsmApplication.setDriverId(String.valueOf(mapOfApplication.get("driverId")));

        //Fetch address details
        Map<String, Object> mapOfAddress = (Map<String, Object>) mapOfApplication.get("address");
        //Fetch geolocation attributes
        Map<String, Object> mapOfLocation = (Map<String, Object>) mapOfAddress.get("geoLocation");
        fsmApplication.setPickupLocationLatitude(String.valueOf(mapOfLocation.get("latitude")));
        fsmApplication.setPickupLocationLongitude(String.valueOf(mapOfLocation.get("longitude")));

        //Fetch citizen details
        Map<String, Object> mapOfCitizen = (Map<String, Object>) mapOfApplication.get("citizen");
        citizen.setContactNumber(String.valueOf(mapOfCitizen.get("mobileNumber")));
        citizen.setName(String.valueOf(mapOfCitizen.get("name")));
        fsmApplication.setCitizen(citizen);

        //Fetch pickup location details from Fsm response

        pickupAddress.setDoorNo(String.valueOf(mapOfAddress.get("doorNo")));
        pickupAddress.setPlotNo(String.valueOf(mapOfAddress.get("plotNo")));
        pickupAddress.setCity(String.valueOf(mapOfAddress.get("city")));
        pickupAddress.setDistrict(String.valueOf(mapOfAddress.get("district")));
        pickupAddress.setLandmark(String.valueOf(mapOfAddress.get("landmark")));
        pickupAddress.setState(String.valueOf(mapOfAddress.get("state")));
        pickupAddress.setCountry(String.valueOf(mapOfAddress.get("country")));
        pickupAddress.setPincode(String.valueOf(mapOfAddress.get("pincode")));
        fsmApplication.setPickupAddress(pickupAddress);

        //Fetch drop location from predefined POIs for FSTP of the tenant id

        fsmApplication.setDropAddress(dropAddress);

        return fsmApplication;
    }

    //FSM trip status is updated for in the input string. It is assumed that the json string has data for only one trip.
    //This method updates 3 fields in the json input - adds a workflow status, updates end time, updates volume carried
    public static Map<String, Object> updateFsmTripEndActionJson(String jsonString, String endType) {
        logger.info("## Invoked updateFsmTripEndActionJson");
        Map<String, Object> result = getStringObjectMap(jsonString);

        List<Object> listOfTrips = (List<Object>) result.get("vehicleTrip");

        //Invalid use case for update - json input provided must have exactly one trip in it
        if (listOfTrips.size() != 1) {
            logger.error("## Number of trips is not equal to 1 : " + listOfTrips.size());
            return null;
        }

        //Update 3 trip fields to indicate closure
        Map<String, Object> mapOfVehicleTrip = (Map<String, Object>) listOfTrips.get(0);

        //Step 1 - Prep data to set
        long currentTime = System.currentTimeMillis();

        List<Object> listOfTripDetails = (List<Object>) mapOfVehicleTrip.get("tripDetails");
        Map<String, Object> mapOfTripDetails = (Map<String, Object>) listOfTripDetails.get(0);
        double volumeCarried = (Double) mapOfTripDetails.get("volume");

        Map<String, Object> actionMap = Collections.singletonMap("action", Constants.FSM_TRIP_COMPLETION_STATUS);

        //Step 2 - Set data to output
        mapOfVehicleTrip.put("tripEndTime", currentTime);
        mapOfVehicleTrip.put("volumeCarried", volumeCarried);
        mapOfVehicleTrip.put("endType", endType);
        result.put("workflow", actionMap);
        result.remove("responseInfo");
        result.remove("totalCount");

        return result;
    }

    public static String convertMapToJsonString(Map<String, Object> result) {
        ObjectMapper mapper = new ObjectMapper();
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        try {
            mapper.writeValue(bout, result);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        byte[] objectBytes = bout.toByteArray();
        return(new String(objectBytes));
    }
}
