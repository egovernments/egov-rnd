import 'dart:convert';

List<AlertPolygon> alertPolygonFromJson(String str) =>
    List<AlertPolygon>.from(json.decode(str).map((x) => AlertPolygon.fromJson(x)));

String alertPolygonToJson(List<AlertPolygon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlertPolygon {
  String? id;
  String? locationName;
  dynamic tenantId;
  String? status;
  String? type;
  List<LocationDetails>? locationDetails;
  String? alert;
  String? userId;
  int? distanceMeters;

  AlertPolygon({
    this.id,
    this.locationName,
    this.tenantId,
    this.status,
    this.type,
    this.locationDetails,
    this.alert,
    this.userId,
    this.distanceMeters,
  });

  factory AlertPolygon.fromJson(Map<String, dynamic> json) => AlertPolygon(
        id: json["id"],
        locationName: json["locationName"],
        tenantId: json["tenantId"],
        status: json["status"],
        type: json["type"],
        locationDetails: json["locationDetails"] == null
            ? []
            : List<LocationDetails>.from(json["locationDetails"]!.map((x) => LocationDetails.fromJson(x))),
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
        "locationDetails": locationDetails == null ? [] : List<dynamic>.from(locationDetails!.map((x) => x.toJson())),
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
