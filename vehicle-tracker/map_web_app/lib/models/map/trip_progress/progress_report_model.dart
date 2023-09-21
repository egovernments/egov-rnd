class ProgressReportModel {
  
  String? id;
  String? tripId;
  String? progressReportedTime;
  List<ProgressData>? progressData;
  String? matchedPoiId;
  String? userId;

  ProgressReportModel({this.id, this.tripId, this.progressReportedTime, this.progressData, this.matchedPoiId, this.userId});

  ProgressReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['tripId'];
    progressReportedTime = json['progressReportedTime'];
    if (json['progressData'] != null) {
      progressData = <ProgressData>[];
      json['progressData'].forEach((v) {
        progressData!.add(ProgressData.fromJson(v));
      });
    }
    matchedPoiId = json['matchedPoiId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tripId'] = tripId;
    data['progressReportedTime'] = progressReportedTime;
    if (progressData != null) {
      data['progressData'] = progressData!.map((v) => v.toJson()).toList();
    }
    data['matchedPoiId'] = matchedPoiId;
    data['userId'] = userId;
    return data;
  }
}

class ProgressData {
  String? progressTime;
  Location? location;

  ProgressData({this.progressTime, this.location});

  ProgressData.fromJson(Map<String, dynamic> json) {
    progressTime = json['progressTime'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['progressTime'] = progressTime;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Location {
  double latitude;
  double longitude;

  Location({required this.latitude, required this.longitude});

  Location.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        longitude = json['longitude'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
