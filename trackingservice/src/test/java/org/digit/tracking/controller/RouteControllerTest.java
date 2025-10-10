package org.digit.tracking.controller;

import org.digit.tracking.service.ConfigService;
import org.digit.tracking.service.RouteService;
import org.junit.jupiter.api.Test;
import org.openapitools.model.LocationAlert;
import org.openapitools.model.Route;
import org.openapitools.model.ServiceType;
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

@WebMvcTest(RouteController.class)
public class RouteControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private RouteService service;

    @Test
    public void getRouteShouldReturnRouteList() throws Exception {
        //Set test data
        List<Route> entityList= new ArrayList();
        Route entity = new Route();
        entity.setUserId("TestUser");
        entity.setStatus(Route.StatusEnum.ACTIVE);
        entity.setName("Route name");
        entity.setStartPoi("StartPoiUUID");
        entityList.add(entity);

        //Mock the service call
        when(service.getRoutesById("TestId")).thenReturn(entity);
        //Perform assertion
        this.mockMvc.perform(get("/api/v3/route/TestId")).andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(containsString("TestUser")));
    }

}
