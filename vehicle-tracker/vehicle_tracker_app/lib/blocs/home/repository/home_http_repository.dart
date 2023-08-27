import 'dart:developer';

import 'package:get/get.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/data/http_service.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';
import 'package:vehicle_tracker_app/models/trip/trip_tracker_info/trip_tracker_hive_model.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/util/toaster.dart';

class HomeHTTPRepository {
  // ? Uses the userId to get the list of trips.
  Future<List<Rx<HomeTripModel>>> getHomeTripData(String userId) async {
    log("Calling Home Trip Info API");

    String reqUrl = "$apiUrl/trip/_search?usedId=$userId";
    List<Rx<HomeTripModel>> homeTripModel = [];

    final response = await HttpService.getRequest(reqUrl);

    if (response.statusCode != 200) {
      toaster(Get.context, AppTranslation.NETWORK_ERROR_MESSAGE.tr, isError: true);
      return homeTripModel;
    }

    final data = response.body as List<dynamic>;

    for (var item in data) {
      homeTripModel.add(Rx(HomeTripModel.fromJson(item)));
    }

    return homeTripModel;
  }

  // ? API to start and end the Trip
  // ? If start is true, then the trip will start
  // ? If start is false, then the trip will end
  Future<bool> updateTrip(HomeTripModel data, bool start) async {
    String reqUrl = "$apiUrl/trip/_update";

    Map<String, dynamic> body = {
      "id": data.id,
      "status": start ? "in_progress" : "completed",
      "userId": testUserId,
    };

    final response = await HttpService.putRequest(reqUrl, body);

    // ? If the response is null OR not 200, then return false.
    if (response.statusCode == null || response.statusCode != 200) {
      log("Error Code: ${response.statusCode}");
      log("Error: ${response.body}");
      return false;
    }

    return true;
  }

  // ? API to update the trip progress
  Future<bool> updateTripProgress(HomeTripModel data, List<TripHiveModel> positions) async {
    String reqUrl = "$apiUrl/trip/_progress";

    List<Map<String, dynamic>> updates = [];

    for (var position in positions) {
      updates.add(
        {
          "progressTime": position.timestamp,
          "location": {
            "latitude": position.latitude,
            "longitude": position.longitude,
          },
        },
      );
    }

    Map<String, dynamic> body = {
      "tripId": data.id,
      "progressReportedTime": DateTime.now().toIso8601String(),
      "progressData": updates,
      "userId": testUserId,
    };

    log("Body: $body");

    final response = await HttpService.putRequest(reqUrl, body);

    // ? If the response is null OR not 200, then return false.
    if (response.statusCode == null || response.statusCode != 200) {
      log("Error Code: ${response.statusCode}");
      log("Error: ${response.body}");
      return false;
    }

    return true;
  }

  // ? API to create a new POI
  Future<bool> callTrackingApi(List<TripHiveModel> positions, String alert, String tripId) async {
    String reqUrl = "$apiUrl/poi/_create";

    List<Map<String, double>> latLong = [];

    for (var position in positions) {
      latLong.add({"latitude": position.latitude, "longitude": position.longitude});
    }

    Map<String, dynamic> body = {
      "id": tripId,
      "locationName": "Any name assigned to the location",
      "status": "active",
      "type": "point",
      "locationDetails": latLong,
      "alert": [alert],
      "userId": testUserId,
      "distanceMeters": 200000,
    };

    final response = await HttpService.postRequestWithoutToken(reqUrl, body);

    // ? If the response is null OR not 200, then return false.
    if (response.statusCode == null || response.statusCode != 200) {
      log("Error: ${response.body}");
      log("Error Code: ${response.statusCode}");
      return false;
    }

    return true;
  }
}
