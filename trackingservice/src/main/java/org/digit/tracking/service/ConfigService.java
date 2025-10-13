package org.digit.tracking.service;

import org.digit.tracking.data.dao.ConfigDao;
import org.openapitools.model.LocationAlert;
import org.openapitools.model.ServiceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConfigService {

    @Autowired
    ConfigDao configDao;
    public List<LocationAlert> getLocationAlerts() {
        //TODO - Mock list of alerts. Replace with database call
        return fetchAlertsFromDB();
    }

    public List<ServiceType> getServiceTypes() {
        //TODO - Mock list of alerts. Replace with database call
        return fetchServicesFromDB();
    }

    private List<LocationAlert> fetchAlertsFromDB() {
        List<LocationAlert> locationAlertList = configDao.fetchAllLocationAlerts();
        return locationAlertList;
    }
    private List<ServiceType> fetchServicesFromDB() {

        //ConfigDao configDao = new ConfigDao();
        List<ServiceType> servicelist = configDao.fetchAllServiceTypes();
        return servicelist;
    }
}