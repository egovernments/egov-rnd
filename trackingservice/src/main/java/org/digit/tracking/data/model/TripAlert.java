package org.digit.tracking.data.model;

//Entity that manages TripAlert data
public class TripAlert {
    private String id;
    private String tripId;
    private String applicationNo;
    private String tripProgressId;
    private String alert;
    private String alertDateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTripId() {
        return tripId;
    }
    public String getApplicationNo() {
        return applicationNo;
    }

    public void setApplicationNo(String applicationNo) {
        this.applicationNo = applicationNo;
    }

    public void setTripId(String tripId) {
        this.tripId = tripId;
    }

    public String getTripProgressId() {
        return tripProgressId;
    }

    public void setTripProgressId(String tripProgressId) {
        this.tripProgressId = tripProgressId;
    }

    public String getAlert() {
        return alert;
    }

    public void setAlert(String alert) {
        this.alert = alert;
    }

    public String getAlertDateTime() {
        return alertDateTime;
    }

    public void setAlertDateTime(String alertDateTime) {
        this.alertDateTime = alertDateTime;
    }

}
