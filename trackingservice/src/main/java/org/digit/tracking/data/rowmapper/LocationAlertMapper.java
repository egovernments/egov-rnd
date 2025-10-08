package org.digit.tracking.data.rowmapper;

import org.openapitools.model.LocationAlert;
import org.openapitools.model.ServiceType;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LocationAlertMapper implements RowMapper<LocationAlert> {
    public LocationAlert mapRow(ResultSet rs, int rowNum) throws SQLException {
        LocationAlert locationAlert = new LocationAlert();
        locationAlert.setCode(rs.getString("code"));
        locationAlert.setTitle(rs.getString("title"));
        return locationAlert;
    }

}
