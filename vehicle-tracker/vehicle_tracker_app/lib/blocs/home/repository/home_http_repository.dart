import 'dart:developer';

import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/data/http_service.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';

class HomeHTTPRepository {
  String tripUrl = "$apiUrl/trip/_search";

  // ? Uses the userId to get the list of trips.
  Future<List<HomeTripModel>> getHomeTripData(String userId) async {
    List<HomeTripModel> homeTripModel = [];

    final response = await HttpService.getRequest("$tripUrl?usedId=$userId");

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
}
