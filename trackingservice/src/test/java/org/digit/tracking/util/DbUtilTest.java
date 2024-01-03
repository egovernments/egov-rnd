package org.digit.tracking.util;

import org.junit.jupiter.api.Test;
import org.openapitools.model.Location;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class DbUtilTest {

    DbUtil dbUtil = new DbUtil();
    @Test
    public void convertSpatialToLocationReturnPOINTLocations() throws Exception {
        //Set test data
        String spatialData = "POINT(78.302284 17.454218)";
        List<Location> locationList = dbUtil.convertSpatialToLocation(spatialData);
        assertEquals(1, locationList.size());
        assertEquals(78.302284f, locationList.get(0).getLatitude());
    }

    @Test
    public void convertSpatialToLocationReturnPOLYGONLocations() throws Exception {
        //Set test data
        String spatialData = "POLYGON ((78.302284 17.454218, 78.31177 17.470797, 78.309875 17.45864, 78.302284 17.454218))";
        List<Location> locationList = dbUtil.convertSpatialToLocation(spatialData);
        assertEquals(4, locationList.size());
        assertEquals(78.31177f, locationList.get(1).getLatitude());
    }
    @Test
    public void convertSpatialToLocationReturnLINESTRINGLocations() throws Exception {
        //Set test data
        String spatialData = "LINESTRING (78.302284 17.454218, 78.31177 17.470797)";
        List<Location> locationList = dbUtil.convertSpatialToLocation(spatialData);
        assertEquals(2, locationList.size());
        assertEquals(17.470797f, locationList.get(1).getLongitude());
    }

    @Test
    public void testEpochToOffsetDate() {
        assertEquals(dbUtil.epochToDateFormat(Long.valueOf("1698741386671")), "2023-10-31T08:36:26.671Z");
    }
}
