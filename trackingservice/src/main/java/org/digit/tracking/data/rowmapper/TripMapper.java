package org.digit.tracking.data.rowmapper;

import org.digit.tracking.util.DbUtil;
import org.openapitools.model.Operator;
import org.openapitools.model.Trip;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TripMapper implements RowMapper<Trip> {
    DbUtil dbUtil = new DbUtil();
    public Trip mapRow(ResultSet rs, int rowNum) throws SQLException {
        Trip trip = new Trip();
        trip.setId(rs.getString("id"));
        trip.setOperator(dbUtil.dbJsonToOperator(rs, "operator", Operator.class));
        trip.setServiceCode(rs.getString("service_code"));
        trip.setStatus(Trip.StatusEnum.valueOf(rs.getString("status").toUpperCase()));
        trip.setRouteId(rs.getString("route_id"));
        trip.setActualEndTime(rs.getString("actual_end_time"));
        trip.setActualStartTime(rs.getString("actual_start_time"));
        trip.setPlannedStartTime(rs.getString("planned_start_time"));
        trip.setPlannedEndTime(rs.getString("planned_end_time"));
        trip.setUserId(rs.getString("user_id"));
        trip.setTenantId(rs.getString("tenant_id"));
        trip.setReferenceNo(rs.getString("reference_no"));
        trip.setTripEndType(rs.getString("trip_end_type"));
        return trip;
    }
}
