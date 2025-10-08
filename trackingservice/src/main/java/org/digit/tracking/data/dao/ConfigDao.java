package org.digit.tracking.data.dao;

import org.digit.tracking.data.rowmapper.LocationAlertMapper;
import org.digit.tracking.data.rowmapper.ServiceTypeMapper;
import org.openapitools.model.LocationAlert;
import org.openapitools.model.ServiceType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.List;
@Service
public class ConfigDao {
    Logger logger = LoggerFactory.getLogger(ConfigDao.class);
    final String sqlFetchServiceTypes = "SELECT * FROM service_type";
    final String sqlFetchLocationAlerts = "SELECT * FROM location_alert";

    private DataSource dataSource;

    //Datasource bean is injected
    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    public List<ServiceType> fetchAllServiceTypes() {
        logger.info("## fetchAllServiceTypes");
        JdbcTemplate jdbcTemplateObject = new JdbcTemplate(dataSource);

        List<ServiceType> serviceTypes = jdbcTemplateObject.query(sqlFetchServiceTypes, new ServiceTypeMapper());

        return serviceTypes;
    }

    public List<LocationAlert> fetchAllLocationAlerts() {
        logger.info("## fetchAllLocationAlerts");
        JdbcTemplate jdbcTemplateObject = new JdbcTemplate(dataSource);
        List<LocationAlert> locationAlerts = jdbcTemplateObject.query(sqlFetchLocationAlerts, new LocationAlertMapper());

        return locationAlerts;
    }

}
