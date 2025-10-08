package org.digit.tracking.service;

import org.digit.tracking.data.dao.PoiDao;
import org.openapitools.model.Location;
import org.openapitools.model.POI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.Valid;
import java.util.List;

@Service
public class POIService {

    @Autowired
    PoiDao poiDao;
    public List<POI> getPOIsBySearch(String locationName, String alert, String tenantId) {
        return poiDao.fetchPOIbyFilters(locationName, alert, tenantId);
    }

    public List<POI> searchNearby(Location userLocation, int distanceMeters) {
        return poiDao.searchNearby(userLocation, distanceMeters);
    }
    public List<POI> getPOIsById(String poiId) {
        return poiDao.fetchPOIbyId(poiId);
    }
    public String createPOI(POI poi) {
        return poiDao.createPOI(poi);
    }

    public String updatePOI(POI poi) {
        return poiDao.updatePOI(poi);
    }

    public String inactivatePOI(POI poi) {
        return poiDao.inactivatePOI(poi);
    }
}

