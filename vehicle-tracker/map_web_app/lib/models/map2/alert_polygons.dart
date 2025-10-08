class AlertPolygon {
  String? id;
  String? locationName;
  String? status;
  String? type;
  List<LocationDetails>? locationDetails;
  String? alert;
  String? userId;
  int? distanceMeters;

  AlertPolygon(
      {this.id, this.locationName, this.status, this.type, this.locationDetails, this.alert, this.userId, this.distanceMeters});

  AlertPolygon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationName = json['locationName'];
    status = json['status'];
    type = json['type'];
    if (json['locationDetails'] != null) {
      locationDetails = <LocationDetails>[];
      json['locationDetails'].forEach((v) {
        locationDetails!.add(LocationDetails.fromJson(v));
      });
    }
    alert = json['alert'];
    userId = json['userId'];
    distanceMeters = json['distanceMeters'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['locationName'] = locationName;
    data['status'] = status;
    data['type'] = type;
    if (locationDetails != null) {
      data['locationDetails'] = locationDetails!.map((v) => v.toJson()).toList();
    }
    data['alert'] = alert;
    data['userId'] = userId;
    data['distanceMeters'] = distanceMeters;
    return data;
  }
}

class LocationDetails {
  double? latitude;
  double? longitude;

  LocationDetails({this.latitude, this.longitude});

  LocationDetails.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
