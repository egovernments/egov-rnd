package org.digit.tracking.util;

import org.digit.tracking.data.model.FsmApplication;
import org.digit.tracking.data.model.FsmVehicleTrip;
import org.junit.Test;
import org.openapitools.model.Address;
import org.openapitools.model.Location;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ConverterUtilTest {
    Logger logger = LoggerFactory.getLogger(ConverterUtilTest.class);

    @Test
    public void testAddressToString() {
        Address address;

        //Test 1
        address = new Address();
        address.setCity("Test city");
        address.setPincode("567123");
        address.setDistrict("null");
        assertEquals(ConverterUtil.addressToString(address), "Test city, 567123");

        //Test 2
        address = new Address();
        address.setPlotNo("113");
        address.setCity("Bangalore");
        assertEquals(ConverterUtil.addressToString(address), "113, Bangalore");
    }
}
