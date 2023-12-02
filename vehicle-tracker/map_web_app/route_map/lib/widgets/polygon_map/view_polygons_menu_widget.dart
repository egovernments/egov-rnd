import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../blocs/polygon_map/controllers/map_controllers.dart';

TableRow tableRowHeader() {
  return const TableRow(
    children: [
      Padding(
        padding: EdgeInsets.all(kPadding),
        child: Text("Site Name", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 2),
        child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      // ! Hiding it for now. Will be used in future when we have Last Week Stops API
      // Padding(
      //   padding: EdgeInsets.all(kPadding),
      //   child: Text("Last Week Stops", style: TextStyle(fontWeight: FontWeight.bold)),
      // ),
      Padding(
        padding: EdgeInsets.all(kPadding),
        child: Text("Actions", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

TableRow tableRowItemBuilder(int index, DigitTheme theme, MapControllers controller) {
  final polygon = controller.alertPolygons[index];

  return TableRow(
    decoration: index.isEven ? BoxDecoration(color: theme.colors.quillGray) : null,
    children: [
      Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Text(polygon.locationName ?? ""),
      ),
      Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Text(controller.polygonCentreCalculator(polygon.locationDetails!)),
      ),
      // ! Hiding it for now. Will be used in future when we have Last Week Stops API
      // const Padding(
      //   padding: EdgeInsets.all(kPadding),
      //   child: Center(child: Text("12")),
      // ),
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

          // ! Can be used to delete the polygon
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => controller.removePolygon(polygon),
            icon: const Icon(Icons.delete),
            color: theme.colors.burningOrange,
          ),
        ],
      ),
    ],
  );
}

Widget polygonListMenuWidget(MapControllers controller, BuildContext context) {
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
                  Text("Illegal Dumping Sites", style: textTheme.headlineLarge),
                ],
              ),
            ),

            // * List of all the polygons
            Flexible(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(color: theme.colors.white),
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(1.3),
                  },
                  children: [
                    tableRowHeader(),
                    for (int i = 0; i < controller.alertPolygons.length; i++) tableRowItemBuilder(i, theme, controller)
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
