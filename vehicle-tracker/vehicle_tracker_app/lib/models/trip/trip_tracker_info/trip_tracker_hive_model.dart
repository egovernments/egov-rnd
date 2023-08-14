import 'package:hive/hive.dart';

part 'trip_tracker_hive_model.g.dart';

@HiveType(typeId: 3)
class TripHiveModel extends HiveObject {
  @HiveField(0)
  double latitude;

  @HiveField(1)
  double longitude;

  TripHiveModel({
    required this.latitude,
    required this.longitude,
  });
}
