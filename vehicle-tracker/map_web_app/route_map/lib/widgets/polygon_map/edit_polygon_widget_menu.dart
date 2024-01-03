import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../blocs/polygon_map/controllers/map_controllers.dart';
import '../../constants.dart';

Widget editPolygonMenuWidget(MapControllers controller, BuildContext context) {
  final textTheme = DigitTheme.instance.mobileTheme.textTheme;
  final theme = DigitTheme.instance;

  return Align(
    alignment: Alignment.centerLeft,
    child: SizedBox(
      width: 350,
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
                  Text("Edit Point Location", style: textTheme.headlineLarge),
                ],
              ),
            ),

            // * Text Fields for Site Name
            DigitTextField(
              label: "Site Name",
              controller: controller.siteNameController,
            ),

            // * Dropdown Menu for Site Type
            DigitDropdown<String>(
              value: controller.siteType,
              label: "Site Type",
              menuItems: siteTypes,
              valueMapper: (value) => value,
              onChanged: (value) => controller.siteType = value ?? "",
            ),

            // ! We are not using this field for now
            // * Text Field for Alert Distance
            // DigitTextField(
            //   label: "Alert when within a distance (meters) of ",
            //   controller: controller.siteDistanceController,
            // ),

            // * Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // * Button to Add Location
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPadding),
                  child: DigitElevatedButton(
                    onPressed: () => controller.editPolygon(),
                    child: const Text("Edit Location"),
                  ),
                ),

                // * Button to Cancel
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPadding),
                  child: DigitOutLineButton(
                    onPressed: () => controller.cancelNewPolygon(),
                    label: "\t\tCancel\t\t",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
