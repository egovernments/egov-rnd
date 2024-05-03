import 'dart:developer';

import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../blocs/home/controllers/trip_tracker_controllers.dart';
import 'status_info_widget.dart';

Widget textColumnWidget(Rx<HomeTripModel> data) {
  return Padding(
    padding: DigitTheme.instance.verticalMargin,
    child: Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(7),
      },
      children: [
        textRow(AppTranslation.TRIP_ID.tr, data.value.id),
        textRow(AppTranslation.NAME.tr, data.value.citizen?.name ?? ""),
        textRow(AppTranslation.VEHICLE_NUMBER.tr,
            data.value.vehicle?.registrationNumber ?? ""),
        textRow(AppTranslation.PICK_UP_LOCATION.tr,
            data.value.pickupLocation ?? ""),
        textRow(AppTranslation.DROP_LOCATION.tr, data.value.dropLocation ?? ""),
        textRow(
            AppTranslation.DATE.tr, formattedDate(data.value.plannedStartTime)),
        TableRow(
          children: [
            paddedText("Status", bold: true),
            Row(
              children: [
                GetBuilder<TripControllers>(
                  id: data.value.id,
                  builder: (tripControllers) => statusInfoWidget(
                      data.value.status ?? TripStates.NOTSTARTED),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

TableRow textRow(String key, String value) => TableRow(
      children: [
        paddedText("$key\t\t", bold: true),
        paddedText(value),
      ],
    );

Widget paddedText(String value, {bool bold = false}) => Padding(
      padding: DigitTheme.instance.verticalMargin * 0.65,
      child: Text(
        value,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: bold ? const TextStyle(fontWeight: FontWeight.bold) : null,
      ),
    );

String formattedDate(String? timestamp) {
  if (timestamp == null) {
    return "";
  }
  try {
    final date = DateTime.parse(timestamp);
    return "${date.day}/${date.month}/${date.year}";
  } on Exception catch (e) {
    log(e.toString());
    return "";
  }
}
