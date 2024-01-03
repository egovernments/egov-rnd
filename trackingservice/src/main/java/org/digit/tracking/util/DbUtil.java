package org.digit.tracking.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.openapitools.model.Location;
import org.openapitools.model.Operator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import com.google.common.base.Strings;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.*;

// Common util class to implement id (primary key) generation logic for each entity
@Component
public class DbUtil {
    Logger logger = LoggerFactory.getLogger(DbUtil.class);

    //Basic implementation of id using UUID. entityName is supported for future use cases where id generation logic might vary based on the entity
    public String getId(String... entityName) {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

    //Common method to convert JSON in database to an object list
    public List dbJsonToList(ResultSet rs, String dbColumn, Class<?> T) throws SQLException {
        //Fetch database field into a string json
        String jsonString = rs.getString(dbColumn);
        //Convert json string to array of string
        ObjectMapper mapper = new ObjectMapper();

        //Initialize a generic List object
        List dbJsonList = null;
        //Perform null check prior to json processing
        if (!Strings.isNullOrEmpty(jsonString) && !jsonString.equals("null")){
            try {
                //Identify the class to which the output List should be converted to
                if (T == String.class) {
                    dbJsonList = new ArrayList<String>();
                    System.out.println(jsonString);
                    dbJsonList = Arrays.asList(mapper.readValue(jsonString, String[].class));
                } else if (T == Location.class) {
                    dbJsonList = new ArrayList<Location>();
                    dbJsonList = Arrays.asList(mapper.readValue(jsonString, Location[].class));
                }
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }
        }
        return dbJsonList;
    }

    //Convert JSON of Operator entity to an object
    public Operator dbJsonToOperator(ResultSet rs, String dbColumn, Class<?> T) throws SQLException {
        //Fetch database field into a string json
        String jsonString = rs.getString(dbColumn);
        //Convert json string to array of string
        ObjectMapper mapper = new ObjectMapper();

        Operator dbJson = new Operator();

        try {
            dbJson = mapper.readValue(jsonString, Operator.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        return dbJson;
    }

    //Fetch the list of locations from spatial data which is stored in db
    public List<Location> getLocationDetailsFromSpatial(ResultSet rs) {
        logger.info("## getLocationDetailsFromSpatial in progress ");
        //Initialise
        String spatialDataString;
        //Spatial data can be in any of the 3 position* columns. Hence check the "type" column and identify the correct position* column to use
        try {
            spatialDataString = rs.getString("position");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return convertSpatialToLocation(spatialDataString);
    }

    //Given a string in Spatial format, like "POINT (78.302284 17.454218)" or "POLYGON ((78.302284 17.454218, 78.31177 17.470797, 78.309875 17.45864, 78.302284 17.454218))"
    //convert it into Location(s) list that client can plot on map
    public List<Location> convertSpatialToLocation(String spatialData) {
        //Initialise
        List<Location> locationList = new ArrayList<>();
        String token;
        Location location;

        //Step 1 - Remove the characters not needed
        String spatialDataLocal = spatialData.replaceAll("POINT", "").replaceAll("POLYGON", "").
                replaceAll("LINESTRING", "").replaceAll("\\(", "").replaceAll("\\)", "");
        //Step 2 - Create a tokens list, split by comma
        StringTokenizer tokenizer = new StringTokenizer(spatialDataLocal, ",");
        while (tokenizer.hasMoreTokens()) {
            //Step 3 - Convert tokens list to locations list
            token = tokenizer.nextToken();

            location = new Location();
            location.setLatitude(Float.valueOf(token.trim().split(" ")[1]));
            location.setLongitude(Float.valueOf(token.trim().split(" ")[0]));
            locationList.add(location);
        }
        return locationList;
    }

    //This is for cases where we are just dealing with a single spatial point and array is unnecessary
    public Location convertSpatialSinglePointToLocation(String spatialData) {
        //Initialise
        Location location = new Location();

        //Step 1 - Remove the characters not needed
        String spatialDataLocal = spatialData.replaceAll("POINT", "").replaceAll("POLYGON", "").
                replaceAll("LINESTRING", "").replaceAll("\\(", "").replaceAll("\\)", "");

        location.setLatitude(Float.valueOf(spatialDataLocal.trim().split(" ")[0]));
        location.setLongitude(Float.valueOf(spatialDataLocal.trim().split(" ")[1]));

        return location;
    }

    //Convert epoch date into the standard format supported by VTS
    public String epochToDateFormat(long epoch) {
        Date date = new Date(epoch);
        OffsetDateTime offsetDateTime = date.toInstant()
                .atOffset(ZoneOffset.UTC);
        //OffsetDateTime offsetDateTime = OffsetDateTime.now();
        return offsetDateTime.format(DateTimeFormatter.ISO_DATE_TIME);
    }
}
