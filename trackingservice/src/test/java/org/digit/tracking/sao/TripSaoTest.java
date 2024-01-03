package org.digit.tracking.sao;

import org.digit.tracking.data.sao.TripSao;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TripSaoTest {
    Logger logger = LoggerFactory.getLogger(TripSaoTest.class);
    String driverId = "ccf4998c-e7af-4e4d-a97f-59c51bbf45e5";
    String tenantId = "pb.amritsar";
    String authToken = "3c9c53fc-cb7a-486a-bbdc-cac98eaf9c12";
    String fsmUrl = "https://unified-dev.digit.org/fsm/v1/";
    String vehicleTripUrl = "https://unified-dev.digit.org/vehicle/trip/v1/";
    String applicationNo = "107-FSM-2023-09-22-000323";
    @Test
    public void testDriverSearch(){
        logger.info("##");
        TripSao tripSao = new TripSao();
        tripSao.searchFsmApplicationsForDriver(driverId, tenantId, authToken, fsmUrl);
    }

    @Test
    public void testTripsSearch(){
        logger.info("##");
        TripSao tripSao = new TripSao();
        //TODO - Fix this test
        //tripSao.fetchFsmTripsForApplication(applicationNo, tenantId, authToken, vehicleTripUrl);
    }
}
