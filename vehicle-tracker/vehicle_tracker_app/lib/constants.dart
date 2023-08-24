import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latlong2/latlong.dart';

String uri = dotenv.env["API_URI"] ?? "";

Map<String, String> cities = {
  "City A": "pg.citya",
  "City B": "pg.cityb",
  "City C": "pg.cityc",
};

List<String> cityNames = cities.keys.toList();

double testStartLat = double.parse(dotenv.env["TEST_START_LAT"] ?? "");
double testStartLong = double.parse(dotenv.env["TEST_START_LONG"] ?? "");
double testEndLat = double.parse(dotenv.env["TEST_END_LAT"] ?? "");
double testEndLong = double.parse(dotenv.env["TEST_END_LONG"] ?? "");
String apiUrl = dotenv.env["API_URL"] ?? "";

LatLng testStart = LatLng(testStartLat, testStartLong);
LatLng testEnd = LatLng(testEndLat, testEndLong);


