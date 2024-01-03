package org.digit.tracking.controller;

import org.digit.tracking.service.TripService;
import org.junit.jupiter.api.Test;
import org.openapitools.model.POI;
import org.openapitools.model.Trip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.Matchers.containsString;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(TripController.class)
public class TripControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private TripService service;

    @Test
    public void getTripShouldReturnTripList() throws Exception {
        //Set test data
        List<Trip> entityList= new ArrayList();
        Trip entity = new Trip();
        entity.setUserId("TestUser");
        entity.setStatus(Trip.StatusEnum.ONGOING);
        entity.setServiceCode("SERV-01");
        entity.setId("PoiUUID");
        entityList.add(entity);

        //Mock the service call
        when(service.getTripById("TestId")).thenReturn(entity);
        //Perform assertion
        this.mockMvc.perform(get("/api/v3/trip/TestId")).andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(containsString("TestUser")));
    }

}
