package org.digit.tracking.service;

import org.digit.tracking.data.dao.TripAlertDao;
import org.digit.tracking.data.model.TripAlert;
import org.openapitools.model.AlertInfoResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TripAlertService {

    @Autowired
    TripAlertDao tripAlertDao;

    //Fetch trip alerts and map to API response.
    public List<AlertInfoResponse> getAlerts(String tenantId, String applicationNo, String tripId, String startDate, String endDate) {
        //TODO - Cleanup this logic of date format change. Can use a date function
        if (startDate !=null && !startDate.isEmpty()) {
            startDate += "T00:00:00.000Z";
        }
        if (endDate !=null && !endDate.isEmpty()) {
            endDate += "T23:59:59.999Z";
        }

        //Fetch Trip Alerts
        List<TripAlert> tripAlertList = tripAlertDao.fetchTripAlertsByFilters(tenantId, applicationNo, tripId, startDate, endDate);

        //Map trip alerts to the response info format
        //TODO - this entire format can be simplified using alert response directly.
        List<AlertInfoResponse> alertInfoResponseList = new ArrayList<>();

        for(TripAlert tripAlert : tripAlertList){
            AlertInfoResponse alertInfoResponse = new AlertInfoResponse();
            alertInfoResponse.setAlert(tripAlert.getAlert());
            alertInfoResponse.setTenantId(tenantId);
            alertInfoResponse.setApplicationNo(tripAlert.getApplicationNo());
            alertInfoResponse.setAlertDateTime(tripAlert.getAlertDateTime());
            alertInfoResponse.setTripId(tripAlert.getTripId());
            alertInfoResponse.setAlertId(tripAlert.getId());

            alertInfoResponseList.add(alertInfoResponse);
        }
        return alertInfoResponseList;
    }
}

