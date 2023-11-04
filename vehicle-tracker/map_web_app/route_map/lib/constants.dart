import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latlong2/latlong.dart';

LatLng custom = const LatLng(17.428446, 78.302284);

// ? Important variables
String urlTemplate = dotenv.env["URL_TEMPLATE"] ?? "";
List<String> subDomain = ['a', 'b', 'c'];
String apiUrl = dotenv.env["API_URL"] ?? "";
List<String> siteTypes = ['Waste Land', 'Dumping Ground', 'Landfill'];
