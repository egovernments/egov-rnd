import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latlong2/latlong.dart';

// ? Important variables
String urlTemplate = dotenv.env["URL_TEMPLATE"] ?? "";
List<String> subDomain = ['a', 'b', 'c'];
String apiUrl = dotenv.env["API_URL"] ?? "";
double customLatitude = double.parse(dotenv.env["CUSTOM_LATITUDE"] ?? "17.428446");
double customLongitude = double.parse(dotenv.env["CUSTOM_LONGITUDE"] ?? "78.302284");
LatLng customLatLng = LatLng(customLatitude, customLongitude);
List<String> siteTypes = ['Waste Land', 'Dumping Ground', 'Landfill'];
