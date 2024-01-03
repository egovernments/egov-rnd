package org.digit.tracking.data.dao;

import org.apache.tomcat.util.bcel.Const;
import org.digit.tracking.data.model.TripAlert;
import org.digit.tracking.data.rowmapper.RouteMapper;
import org.digit.tracking.data.rowmapper.TripAlertMapper;
import org.digit.tracking.util.Constants;
import org.digit.tracking.util.DbUtil;
import org.openapitools.model.Route;
import org.openapitools.model.Trip;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TripAlertDao {
    Logger logger = LoggerFactory.getLogger(TripAlertDao.class);
    private DataSource dataSource;
    @Autowired
    DbUtil dbUtil;

    //Datasource bean is injected
    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    //Fetch trip alerts and map them to the application numbers
    final String sqlFetchTripAlertsByFilters = "SELECT ta.trip_id as trip_id, ta.tenant_id as tenant_id, " +
            "'none' as trip_progress_id, " +
            "ta.alert as alert, max(ta.alert_date_time) as alert_date_time, tr.reference_no as application_no, '' as id "+
            "FROM trip_alert ta, trip tr " +
            "where " +
            "ta.tenant_id = COALESCE(:tenantId, ta.tenant_id) and " +
            "ta.trip_id = COALESCE(:tripId, ta.trip_id) and " +
            "ta.alert_date_time BETWEEN COALESCE(:startDate, ta.alert_date_time) and COALESCE(:endDate, ta.alert_date_time) and " +
            "ta.trip_id = tr.id and " +
            "tr.reference_no = COALESCE(:applicationNo, tr.reference_no) " +
            "group by ta.trip_id, ta.tenant_id, ta.alert, " +
                "tr.reference_no having count(ta.alert) > :stoppageAlertThreshold;";

    final String sqlCreateTripAlert = "insert into trip_alert (id, trip_id, trip_progress_id, alert, " +
            "alert_date_time, tenant_id) " +
            "values (:id, :tripId, :tripProgressId, :alert, :alertDateTime, :tenantId )";

    //Search for TripAlerts based on filters
    public List<TripAlert> fetchTripAlertsByFilters(String tenantId, String applicationNo, String tripId, String startDate, String endDate) {
        logger.info("## fetchTripAlertsByFilters");
        NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("tenantId", tenantId);
        params.put("applicationNo", applicationNo);
        params.put("tripId", tripId);
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("stoppageAlertCode", Constants.ILLEGAL_DUMP_YARD_STOPPAGE_CODE);
        params.put("stoppageAlertThreshold", Constants.ILLEGAL_DUMP_YARD_STOPPAGE_THRESHOLD);

        List<TripAlert> tripAlertList = namedParameterJdbcTemplate.query(sqlFetchTripAlertsByFilters, params, new TripAlertMapper());
        return tripAlertList;
    }

    public String updateTripAlert(TripAlert tripAlert, String tenantId) {
        logger.info("## updateTripAlert inside DAO");
        NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);

        Map<String,Object> params = new HashMap<String,Object>();
        String idLocal = dbUtil.getId();

        params.put("id", idLocal);
        params.put("tripId", tripAlert.getTripId());
        params.put("tripProgressId", tripAlert.getTripProgressId());
        params.put("alert", tripAlert.getAlert());
        params.put("alertDateTime", tripAlert.getAlertDateTime());
        params.put("tenantId", tenantId);

        int rowsUpdated = namedParameterJdbcTemplate.update(sqlCreateTripAlert, params);

        if (rowsUpdated != 0) {
            logger.info("Trip alert updated with id " + tripAlert.getTripProgressId());
            return tripAlert.getTripProgressId();
        } else {
            logger.error("Trip update failed with id " + tripAlert.getTripProgressId());
            return null;
        }
    }
}
