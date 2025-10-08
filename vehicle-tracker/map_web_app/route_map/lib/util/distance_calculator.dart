import 'dart:math';

import 'package:latlong2/latlong.dart';

double calculateDistance(LatLng point1, LatLng point2) {
  const R = 6371e3; // radius of Earth in meters
  var lat1 = point1.latitude * pi / 180; // convert to radians
  var lat2 = point2.latitude * pi / 180;
  var deltaLat = (point2.latitude - point1.latitude) * pi / 180;
  var deltaLon = (point2.longitude - point1.longitude) * pi / 180;

  var a = sin(deltaLat / 2) * sin(deltaLat / 2) + cos(lat1) * cos(lat2) * sin(deltaLon / 2) * sin(deltaLon / 2);
  var c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return R * c; // distance in meters
}
