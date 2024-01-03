package org.digit.tracking.data.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.openapitools.model.ServiceType;
import org.springframework.jdbc.core.RowMapper;

public class ServiceTypeMapper implements RowMapper<ServiceType> {
    public ServiceType mapRow(ResultSet rs, int rowNum) throws SQLException {
        ServiceType serviceType = new ServiceType();
        serviceType.setCode(rs.getString("code"));
        serviceType.setName(rs.getString("name"));
        serviceType.setTenantId(rs.getString("tenant_id"));

        return serviceType;
    }

}
