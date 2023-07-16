import 'package:latlong2/latlong.dart';

String uri = "";
String urlTemplate = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
LatLng newDelhi = const LatLng(28.61992743538245, 77.20905101733563);

Map<String, String> cities = {
  "City A": "pg.citya",
  "City B": "pg.cityb",
  "City C": "pg.cityc",
};

List<String> cityNames = cities.keys.toList();
