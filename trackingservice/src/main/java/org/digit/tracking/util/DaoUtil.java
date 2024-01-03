package org.digit.tracking.util;

import org.openapitools.model.Location;
import org.openapitools.model.POI;

import java.util.HashMap;
import java.util.Map;

public class DaoUtil {
    //Create a geometry position compatible with PostgresSQL PostGIS extension
    public static String getGeometryPositionPostgresSQL(POI poi) {
        String geomPosition = "";
        if (poi.getType() == POI.TypeEnum.POINT) {
            //In case of a POINT, only one LatLong pair will be sent by client app in locationDetails
            geomPosition = "POINT(" + poi.getLocationDetails().get(0).getLongitude() + " " + poi.getLocationDetails().get(0).getLatitude() + ")";
        } else if (poi.getType() == POI.TypeEnum.POLYGON) {
            StringBuilder polyBuffStr = new StringBuilder();
            int indx = 1;
            for (Location location : poi.getLocationDetails()) {
                polyBuffStr.append(location.getLongitude()).append(" ").append(location.getLatitude());
                //Avoid a comma after the last element in concatenated list
                if (indx < poi.getLocationDetails().size()) {
                    indx++;
                    polyBuffStr.append(" , ");
                }
            }
            geomPosition = "POLYGON((" + polyBuffStr + "))";
        } else {
            StringBuilder polyBuffStr = new StringBuilder();
            int indx = 1;
            for (Location location : poi.getLocationDetails()) {
                polyBuffStr.append(location.getLongitude()).append(" ").append(location.getLatitude());
                //Avoid a comma after the last element in concatenated list
                if (indx < poi.getLocationDetails().size()) {
                    indx++;
                    polyBuffStr.append(" , ");
                }
            }
            geomPosition = "LINESTRING(" + polyBuffStr + ")";
        }
        return geomPosition;
    }
    //Create position POINT, LINE and POLYGON strings that comply with MySQL spatial datatype. Null values are not allowed and hence defaults are set
    @Deprecated
    public static Map<String, String> getPositionStringMapMySQL(POI poi){
        //Initialise spatial position fields
        String positionPoint = "POINT(0.0 0.0)";;
        String positionPolygon = "POLYGON((0.0 0.0, 0.1 0.1, 0.1 0.1, 0.0 0.0))";
        String positionLine = "LINESTRING(0.0 0.0, 0.1 0.1)";

        //TODO - Optimise the entire block of code here
        if (poi.getType() == POI.TypeEnum.POINT) {
            //In case of a POINT, only one LatLong pair will be sent by client app in locationDetails
            positionPoint = "POINT(" + poi.getLocationDetails().get(0).getLatitude() + " " + poi.getLocationDetails().get(0).getLongitude() + ")";
        } else if (poi.getType() == POI.TypeEnum.POLYGON) {
            StringBuilder polyBuffStr = new StringBuilder();
            int indx = 1;
            for (Location location : poi.getLocationDetails()) {
                polyBuffStr.append(location.getLatitude()).append(" ").append(location.getLongitude());
                //Avoid a comma after the last element in concatenated list
                if (indx < poi.getLocationDetails().size()) {
                    indx++;
                    polyBuffStr.append(" , ");
                }
            }
            positionPolygon = "POLYGON((" + polyBuffStr + "))";
        } else {
            StringBuilder polyBuffStr = new StringBuilder();
            int indx = 1;
            for (Location location : poi.getLocationDetails()) {
                polyBuffStr.append(location.getLatitude()).append(" ").append(location.getLongitude());
                //Avoid a comma after the last element in concatenated list
                if (indx < poi.getLocationDetails().size()) {
                    indx++;
                    polyBuffStr.append(" , ");
                }
            }
            positionLine = "LINESTRING(" + polyBuffStr + ")";
        }

        Map<String, String> positionsMap = new HashMap<>();
        positionsMap.put("positionPoint", positionPoint);
        positionsMap.put("positionPolygon", positionPolygon);
        positionsMap.put("positionLine", positionLine);
        return positionsMap;
    }
}
