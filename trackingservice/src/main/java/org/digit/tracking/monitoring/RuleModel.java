package org.digit.tracking.monitoring;

import java.util.List;
//RuleModel holds the data related to an event. Rules are then executed using this data
public class RuleModel {
    private String matchedPoi;
    private int distanceFromPoiMeters;
    private boolean matchedPoiInTrip;
    private boolean matchedPoiIsTripStart;
    private boolean matchedPoiIsTripEnd;
    private String progressId;
    private String tripId;
    private String alert;
    private String routeEndPoi;
    private String tenantId;
    private String authToken;

    public String getMatchedPoi() {
        return matchedPoi;
    }

    public void setMatchedPoi(String matchedPoi) {
        this.matchedPoi = matchedPoi;
    }

    public int getDistanceFromPoiMeters() {
        return distanceFromPoiMeters;
    }

    public void setDistanceFromPoiMeters(int distanceFromPoiMeters) {
        this.distanceFromPoiMeters = distanceFromPoiMeters;
    }

    public boolean isMatchedPoiInTrip() {
        return matchedPoiInTrip;
    }

    public void setMatchedPoiInTrip(boolean matchedPoiInTrip) {
        this.matchedPoiInTrip = matchedPoiInTrip;
    }

    public boolean isMatchedPoiIsTripStart() {
        return matchedPoiIsTripStart;
    }

    public void setMatchedPoiIsTripStart(boolean matchedPoiIsTripStart) {
        this.matchedPoiIsTripStart = matchedPoiIsTripStart;
    }

    public boolean isMatchedPoiIsTripEnd() {
        return matchedPoiIsTripEnd;
    }

    public void setMatchedPoiIsTripEnd(boolean matchedPoiIsTripEnd) {
        this.matchedPoiIsTripEnd = matchedPoiIsTripEnd;
    }

    public String getProgressId() {
        return progressId;
    }
    public void setProgressId(String progressId) {
        this.progressId = progressId;
    }

    public String getTripId() {
        return tripId;
    }
    public void setTripId(String tripId) {
        this.tripId = tripId;
    }
    public String getAlert() {
        return alert;
    }
    public void setAlert(String alert) {
        this.alert = alert;
    }
    public String getRouteEndPoi() {
        return routeEndPoi;
    }
    public void setRouteEndPoi(String routeEndPoi) {
        this.routeEndPoi = routeEndPoi;
    }
    public String getAuthToken() {
        return authToken;
    }
    public void setAuthToken(String authToken) {
        this.authToken = authToken;
    }
    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }


}
