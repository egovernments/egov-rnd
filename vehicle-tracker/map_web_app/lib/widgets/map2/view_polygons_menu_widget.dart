import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:map_web_app/models/map2/alert_polygons.dart';

import '../../blocs/map2/controllers/map_controllers.dart';

TableRow tableRowHeader() {
  return const TableRow(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 2),
        child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(kPadding),
        child: Text("Last Week \nStops", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(kPadding),
        child: Text("Actions", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

TableRow tableRowItemBuilder(AlertPolygon polygon, DigitTheme theme, MapControllers controller) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Text(controller.polygonCentreCalculator(polygon.locationDetails!)),
    ),
    const Padding(
      padding: EdgeInsets.all(kPadding),
      child: Center(child: Text("12")),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () => controller.editPolygonSetup(polygon),
          icon: const Icon(Icons.edit),
          color: theme.colors.burningOrange,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () => controller.removePolygon(polygon),
          icon: const Icon(Icons.delete),
          color: theme.colors.burningOrange,
        ),
      ],
    ),
  ]);
}

Widget createPolygonMenuWidget(MapControllers controller, BuildContext context) {
  final textTheme = DigitTheme.instance.mobileTheme.textTheme;
  final theme = DigitTheme.instance;

  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      width: 400,
      constraints: const BoxConstraints(maxHeight: 400),
      child: DigitCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: theme.colors.burningOrange),
                  Text("Add Point Location", style: textTheme.headlineLarge),
                ],
              ),
            ),

            // * List of all the polygons
            Flexible(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(color: theme.colors.black),
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    tableRowHeader(),
                    for (final polygon in controller.alertPolygons) tableRowItemBuilder(polygon, theme, controller),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: kPadding),
              child: DigitElevatedButton(
                onPressed: () {
                  controller.isDrawing.value = true;
                },
                child: const Text("Create Polygon"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
