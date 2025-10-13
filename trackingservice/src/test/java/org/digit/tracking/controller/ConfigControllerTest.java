package org.digit.tracking.controller;

import static org.hamcrest.Matchers.containsString;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.digit.tracking.controller.ConfigController;
import org.digit.tracking.service.ConfigService;
import org.junit.jupiter.api.Test;
import org.openapitools.model.LocationAlert;
import org.openapitools.model.ServiceType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.ArrayList;
import java.util.List;

@WebMvcTest(ConfigController.class)
public class ConfigControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ConfigService service;

    @Test
    public void getServiceShouldReturnServiceList() throws Exception {
        //Set test data
        List<ServiceType> serviceTypeList= new ArrayList();
        ServiceType serviceType = new ServiceType();
        serviceType.setTenantId("Testulb");
        serviceType.setName("Service Name");
        serviceType.setCode("SERV-001");
        serviceTypeList.add(serviceType);

        //Mock the service call
        when(service.getServiceTypes()).thenReturn(serviceTypeList);
        //Perform assertion
        this.mockMvc.perform(get("/api/v3/config/_services")).andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(containsString("Service")));
    }

    @Test
    public void getAlertsShouldReturnAlertList() throws Exception {
        //Set test data
        List<LocationAlert> alertList= new ArrayList();
        LocationAlert alert = new LocationAlert();
        alert.setTitle("Alert title");
        alert.setCode("ALERT-001");
        alertList.add(alert);

        //Mock the service call
        when(service.getLocationAlerts()).thenReturn(alertList);
        //Perform assertion
        this.mockMvc.perform(get("/api/v3/config/_alerts")).andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(containsString("Alert")));
    }


}
