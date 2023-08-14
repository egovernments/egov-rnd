import 'package:hive/hive.dart';

import '../../../models/trip/trip_tracker_info/trip_tracker_hive_model.dart';

class HomeHiveRepository {
  // ? Store Trip Data
  Future<void> storeTripData(TripHiveModel tripHiveModel) async {
    await Hive.box("tracker").add(tripHiveModel);
  }

  // ? Get Trip Data
  List<TripHiveModel> getTripData() {
    return Hive.box("tracker").values.toList().cast<TripHiveModel>();
  }

  // ? Delete Trip Data
  Future<void> deleteTripData() async {
    await Hive.box("tracker").clear();
  }
}
