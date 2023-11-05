import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:route_map/blocs/route_map/controllers/route_controllers.dart';

List<Polygon> polygonLayerWidget(RouteControllers controller) {
  List<Polygon> polygons = [];

  for (var alertPolygon in controller.alertPolygons) {
    polygons.add(Polygon(
      points: controller.polygonPointBuilder(alertPolygon.locationDetails),
      color: DigitTheme.instance.colors.lavaRed.withOpacity(0.5),
      borderColor: DigitTheme.instance.colors.lavaRed,
      borderStrokeWidth: 2,
      isFilled: true,
    ));
  }

  return polygons;
}