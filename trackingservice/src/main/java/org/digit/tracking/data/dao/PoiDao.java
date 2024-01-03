package org.digit.tracking.data.dao;

import org.digit.tracking.data.rowmapper.POIMapper;
import org.digit.tracking.util.DaoUtil;
import org.digit.tracking.util.DbUtil;
import org.digit.tracking.util.JsonUtil;
import org.openapitools.model.Location;
import org.openapitools.model.POI;
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
public class PoiDao {
    Logger logger = LoggerFactory.getLogger(PoiDao.class);

    @Autowired
    DbUtil dbUtil;
    final String sqlFetchPoiById = "SELECT id, location_name, status, type, alert, user_id, tenant_id, " +
            "ST_AStext(position) as position, " +
            "0 as distance_meters FROM poi where id = :poiId and status = 'active' ";

    //Query filter is slightly complicated as it has to handle scenario where input field is null and data in table is also null.
    //In such case, COALESCE is incorrect as MySQL returns a false for null = null check
    final String sqlFetchPoiByFilters = "SELECT id, location_name, status, type, alert, user_id, tenant_id, " +
            "ST_AStext(position) as position, " +
            "0 as distance_meters FROM poi " +
            "where " +
            "tenant_id = :tenantId " +
            "and status = 'active' " +
            "and location_name like COALESCE(:locationName, location_name) " +
            "and (:alert = 'null' or :alert = alert) " +
            ";";

    //TODO - Distance meters clause can be optimised. Lot of repeated code. Postgres restrictions.
    final String sqlSearchNearbyOfLocation = "SELECT id, location_name, status, type, alert, user_id, tenant_id, " +
            "ST_AStext(position) as position, " +
            "ST_DistanceSphere(position, ST_MakePoint(:searchLongitude, :searchLatitude)) as distance_meters " +
            "FROM poi " +
            "where status = 'active' " +
            "and ST_DistanceSphere(position, ST_MakePoint(:searchLongitude, :searchLatitude)) <= :searchDistance " +
            "order by ST_DistanceSphere(position, ST_MakePoint(:searchLongitude, :searchLatitude)) asc;";
    final String sqlCreatePoi = "insert into poi (id, tenant_id, location_name, status, type, alert, " +
            "created_date, created_by, updated_date, updated_by, user_id, position) " +
            "values (?,?,?,?,?,?,?,?,?,?,?,ST_GeometryFromText(?))";
    final String sqlUpdatePoi = "update poi " +
            "set " +
            "type = :type, " +
            "position = ST_GeometryFromText(:position), " +
            "updated_date = :currentDateString , " +
            "updated_by = :updatedBy " +
            "where id = :poiId " +
            "and tenant_id = :tenantId";
    final String sqlUpdateInactivatePoi = "update poi " +
            "set " +
            "status = :status, " +
            "updated_date = :currentDateString , " +
            "updated_by = :updatedBy " +
            "where id = :poiId " +
            "and tenant_id = :tenantId";

    private DataSource dataSource;

    //Datasource bean is injected
    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<POI> fetchPOIbyId(String poiId) {
        logger.info("## fetchPOIbyId");
        NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("poiId", poiId);

        return namedParameterJdbcTemplate.query(sqlFetchPoiById, params, new POIMapper());
    }

    public List<POI> searchNearby(Location userLocation, int distanceMeters) {
        logger.info("## searchNearby in Dao");
        NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("searchLongitude", userLocation.getLongitude());
        params.put("searchLatitude", userLocation.getLatitude());
        params.put("searchDistance", distanceMeters);

        return namedParameterJdbcTemplate.query(sqlSearchNearbyOfLocation, params, new POIMapper());
    }

    public List<POI> fetchPOIbyFilters(String locationName, String alert, String tenantId) {
        logger.info("## fetchPOIbyFilters");
        NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("tenantId", tenantId);
        if (alert == null || alert.isEmpty()) alert = "null";
        params.put("alert", alert);
        params.put("locationName", locationName);

        //Partial search is supported for location name
        if (locationName != null) {
            params.put("locationName", "%"+locationName+"%");
        }else{
            params.put("locationName", null);
        }

        return namedParameterJdbcTemplate.query(sqlFetchPoiByFilters, params, new POIMapper());
    }

    //Update POI based on supported fields
    public String updatePOI(POI poi) {
        logger.info("## updatePOI inside DAO");
        OffsetDateTime offsetDateTime = OffsetDateTime.now();
        String currentDateString = offsetDateTime.format(DateTimeFormatter.ISO_DATE_TIME);

        String positionGeom = DaoUtil.getGeometryPositionPostgresSQL(poi);

        NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("tenantId", poi.getTenantId());
        params.put("poiId", poi.getId());
        params.put("type", poi.getType().getValue());
        params.put("position", positionGeom);
        params.put("currentDateString", currentDateString);
        params.put("updatedBy", poi.getUserId());

        int result = namedParameterJdbcTemplate.update(sqlUpdatePoi, params);
        if (result != 0) {
            logger.info("POI updated with id " + poi.getId());
            return poi.getId();
        } else {
            logger.error("POI update failed with id " + poi.getId());
            return null;
        }
    }

    //Create POI and save it in database
    public String createPOI(POI poi) {
        logger.info("## createPOI");
        //TODO - Convert this to named jdbc template
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        //Prepare input data for the SQL
        String idLocal = dbUtil.getId();
        //String alerts = JsonUtil.getJsonFromObject(poi.getAlert());
        String alerts = poi.getAlert();

        String positionGeom = DaoUtil.getGeometryPositionPostgresSQL(poi);
        OffsetDateTime offsetDateTime = OffsetDateTime.now();
        String currentDateString = offsetDateTime.format(DateTimeFormatter.ISO_DATE_TIME);

        //Audit information
        String createdBy = poi.getUserId();
        String updatedBy = poi.getUserId();

        Object[] args = new Object[]{idLocal, poi.getTenantId(), poi.getLocationName(), poi.getStatus().toString(),
                poi.getType().toString(), alerts, currentDateString,
                createdBy, currentDateString, updatedBy, poi.getUserId(), positionGeom};

        int result = jdbcTemplate.update(sqlCreatePoi, args);
        if (result != 0) {
            logger.info("POI created with id " + idLocal);
            return idLocal;
        } else {
            logger.error("POI creation failed with id, locationName " + idLocal + " " + poi.getLocationName());
            return null;
        }
    }

    public String inactivatePOI(POI poi) {
        logger.info("## inactivatePOI inside DAO");
        OffsetDateTime offsetDateTime = OffsetDateTime.now();
        String currentDateString = offsetDateTime.format(DateTimeFormatter.ISO_DATE_TIME);

        NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("tenantId", poi.getTenantId());
        params.put("poiId", poi.getId());
        params.put("updatedBy", poi.getUserId());
        params.put("status", POI.StatusEnum.INACTIVE.getValue());
        params.put("currentDateString", currentDateString);

        int result = namedParameterJdbcTemplate.update(sqlUpdateInactivatePoi, params);
        if (result != 0) {
            logger.info("POI inactivated with id " + poi.getId());
            return poi.getId();
        } else {
            logger.error("POI inactivation failed with id " + poi.getId());
            return null;
        }
    }
}
