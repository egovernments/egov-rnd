package org.digit.tracking.data.model;

import org.openapitools.model.Address;
import org.openapitools.model.Citizen;

import java.util.List;

//Entity with fields retrieved from FSM system's citizen application
public class FsmApplication {
    private String tenantId;
    private String applicationNo;
    private String applicationStatus;
    private String pickupLocationLatitude;
    private String pickupLocationLongitude;
    private String driverId;
    private Citizen citizen;

    private Address pickupAddress;
    private Address dropAddress;
    private List<FsmVehicleTrip> fsmVehicleTripList;

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getApplicationNo() {
        return applicationNo;
    }

    public void setApplicationNo(String applicationNo) {
        this.applicationNo = applicationNo;
    }

    public String getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(String applicationStatus) {
        this.applicationStatus = applicationStatus;
    }

    public String getPickupLocationLatitude() {
        return pickupLocationLatitude;
    }

    public void setPickupLocationLatitude(String pickupLocationLatitude) {
        this.pickupLocationLatitude = pickupLocationLatitude;
    }

    public String getPickupLocationLongitude() {
        return pickupLocationLongitude;
    }

    public void setPickupLocationLongitude(String pickupLocationLongitude) {
        this.pickupLocationLongitude = pickupLocationLongitude;
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public List<FsmVehicleTrip> getFsmVehicleTripList() {
        return fsmVehicleTripList;
    }

    public void setFsmVehicleTripList(List<FsmVehicleTrip> fsmVehicleTripList) {
        this.fsmVehicleTripList = fsmVehicleTripList;
    }
    public Citizen getCitizen() {
        return citizen;
    }
    public void setCitizen(Citizen citizen) {
        this.citizen = citizen;
    }

    public Address getPickupAddress() {
        return pickupAddress;
    }

    public void setPickupAddress(Address pickupAddress) {
        this.pickupAddress = pickupAddress;
    }
    public Address getDropAddress() {
        return dropAddress;
    }
    public void setDropAddress(Address dropAddress) {
        this.dropAddress = dropAddress;
    }

}
