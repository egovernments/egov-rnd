import 'dart:convert';

List<ProgressReportModel> progressReportModelFromJson(String str) =>
    List<ProgressReportModel>.from(json.decode(str).map((x) => ProgressReportModel.fromJson(x)));

String progressReportModelToJson(List<ProgressReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgressReportModel {
  String? id;
  String? tripId;
  DateTime? progressReportedTime;
  DateTime? progressTime;
  Location? location;
  String? alert;

  ProgressReportModel({
    this.id,
    this.tripId,
    this.progressReportedTime,
    this.progressTime,
    this.location,
    this.alert,
  });

  factory ProgressReportModel.fromJson(Map<String, dynamic> json) => ProgressReportModel(
        id: json["id"],
        tripId: json["tripId"],
        progressReportedTime: json["progressReportedTime"] == null ? null : DateTime.parse(json["progressReportedTime"]),
        progressTime: json["progressTime"] == null ? null : DateTime.parse(json["progressTime"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        alert: json["alert"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tripId": tripId,
        "progressReportedTime": progressReportedTime?.toIso8601String(),
        "progressTime": progressTime?.toIso8601String(),
        "location": location?.toJson(),
        "alert": alert,
      };
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
