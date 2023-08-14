import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

import '../../../models/trip/trip_tracker_info/trip_tracker_hive_model.dart';

class HomeHiveRepository {

  // ? Store Trip Data
   Future<void> storeTripData(List<Position> poistions) async {
    List<TripHiveModel> tripHiveModelList = [];
    for (var position in poistions) {
      tripHiveModelList.add(TripHiveModel(
        latitude: position.latitude,
        longitude: position.longitude,
      ));
    }

    await Hive.box("trip").addAll(tripHiveModelList);
  }

  // ? Get Trip Data
  List<TripHiveModel> getTripData() {
    return Hive.box("trip").values.toList().cast<TripHiveModel>();
  }

  // ? Delete Trip Data
  deleteTripData() async {
    await Hive.box("trip").clear();
  }

}