import 'dart:convert';

List<AlertPolygon> alertPolygonFromJson(String str) => List<AlertPolygon>.from(json.decode(str).map((x) => AlertPolygon.fromJson(x)));

String alertPolygonToJson(List<AlertPolygon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlertPolygon {
    String id;
    String locationName;
    dynamic tenantId;
    String status;
    String type;
    List<LocationDetails> locationDetails;
    String alert;
    String userId;
    int distanceMeters;

    AlertPolygon({
        required this.id,
        required this.locationName,
        required this.tenantId,
        required this.status,
        required this.type,
        required this.locationDetails,
        required this.alert,
        required this.userId,
        required this.distanceMeters,
    });

    factory AlertPolygon.fromJson(Map<String, dynamic> json) => AlertPolygon(
        id: json["id"],
        locationName: json["locationName"],
        tenantId: json["tenantId"],
        status: json["status"],
        type: json["type"],
        locationDetails: List<LocationDetails>.from(json["locationDetails"].map((x) => LocationDetails.fromJson(x))),
        alert: json["alert"],
        userId: json["userId"],
        distanceMeters: json["distanceMeters"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "locationName": locationName,
        "tenantId": tenantId,
        "status": status,
        "type": type,
        "locationDetails": List<dynamic>.from(locationDetails.map((x) => x.toJson())),
        "alert": alert,
        "userId": userId,
        "distanceMeters": distanceMeters,
    };
}

class LocationDetails {
    double latitude;
    double longitude;

    LocationDetails({
        required this.latitude,
        required this.longitude,
    });

    factory LocationDetails.fromJson(Map<String, dynamic> json) => LocationDetails(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}
