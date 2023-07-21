import 'package:latlong2/latlong.dart';

String uri = "https://uat.digit.org/egov-location/";
String urlTemplate = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
LatLng newDelhi = const LatLng(28.61992743538245, 77.20905101733563);

Map<String, String> cities = {
  "City A": "pg.citya",
  "City B": "pg.cityb",
  "City C": "pg.cityc",
};

List<String> cityNames = cities.keys.toList();

LatLng testStart = const LatLng(28.546476, 77.335280);
LatLng testEnd = const LatLng(28.639207, 77.368818);
