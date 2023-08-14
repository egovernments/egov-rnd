import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/data/http_service.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';

class HomeHTTPRepository {
  String tripUrl = "$apiUrl/trip/_search";

  // ? Uses the userId to get the list of trips.
  Future<List<HomeTripModel>> getHomeTripData(String userId) async {
    String reqUrl = "$tripUrl?usedId=$userId";
    List<HomeTripModel> homeTripModel = [];

    final response = await HttpService.getRequest(reqUrl);

    if (response.statusCode == 500) {
      log("Server Error: ${response.body}");
      return homeTripModel;
    }

    if (response.statusCode != 200) {
      log("Error: ${response.body}");
      return homeTripModel;
    }

    final data = response.body as List<dynamic>;

    for (var item in data) {
      homeTripModel.add(HomeTripModel.fromJson(item));
    }

    return homeTripModel;
  }

  // ? Used to send tracking data to the server.
  Future<bool> callTrackingApi(List<Position> positions, String alert) async {
    String reqUrl = "$tripUrl/poi/_create";
    List<Map<String, double>> latLong = [];

    for (var position in positions) {
      latLong.add({"latitude": position.latitude, "longitude": position.longitude});
    }

    Map<String, dynamic> body = {
      "id": "string",
      "locationName": "Any name assigned to the location",
      "status": "active",
      "type": "point",
      "locationDetails": latLong,
      "alert": [alert],
      "userId": "rajan123",
      "distanceMeters": 200000,
    };

    try {
      final response = await HttpService.postRequestWithoutToken(reqUrl, body);

      // ? If the response is not 200, then return false.
      if (response.statusCode == null || response.statusCode != 200) {
        return false;
      }

      return true;
    } on Exception catch (e) {
      log("Error: $e");
      return false;
    }
  }
}
