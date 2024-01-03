package org.digit.tracking.data.rowmapper;

import org.digit.tracking.util.DbUtil;
import org.openapitools.model.Route;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RouteMapper implements RowMapper<Route> {

    DbUtil dbUtil = new DbUtil();
    public Route mapRow(ResultSet rs, int rowNum) throws SQLException {
        Route route = new Route();
        route.setId(rs.getString("id"));
        route.setStartPoi(rs.getString("start_poi"));
        route.setEndPoi(rs.getString("end_poi"));
        route.setName(rs.getString("name"));
        route.setStatus(Route.StatusEnum.valueOf(rs.getString("status").toUpperCase()));
        route.setIntermediatePois(dbUtil.dbJsonToList(rs, "intermediate_pois", String.class));
        route.setUserId(rs.getString("user_id"));
        return route;
    }
}
