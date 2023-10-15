import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';

import '../../blocs/home/controllers/trip_tracker_controllers.dart';
import 'status_info_widget.dart';

Widget textColumnWidget(Rx<HomeTripModel> data) {

  return Padding(
    padding: DigitTheme.instance.verticalMargin,
    child: Column(
      children: [
        textRow('Trip ID', data.value.id),
        textRow("Name", data.value.operator?.name ?? ""),
        textRow('Vehicle \nNumber', data.value.operator?.contactNumber ?? ""),
        textRow('Pickup \nLocation', data.value.routeId ?? ""),
        textRow('Drop \nLocation', data.value.routeId ?? ""),
        textRow('Date', data.value.plannedStartTime ?? ""),
        Row(
          children: [
            paddedText("Status\t\t", bold: true),
            GetBuilder<TripControllers>(
              id: "data.value.id",
              builder: (tripControllers) => statusInfoWidget(data.value.status ?? TripStates.NONE),
            ),
          ],
        )
      ],
    ),
    // child: Table(
    //   columnWidths: const {
    //     0: FlexColumnWidth(2),
    //     1: FlexColumnWidth(6),
    //   },
    //   children: [
    //     TableRow(
    //       children: [
    //         paddedText('Trip ID', bold: true),
    //         paddedText(data.value.id),
    //       ],
    //     ),
    //     TableRow(
    //       children: [
    //         paddedText('Name', bold: true),
    //         paddedText(data.value.operator.name),
    //       ],
    //     ),
    //     TableRow(
    //       children: [
    //         paddedText('Vehicle Number', bold: true),
    //         paddedText(data.value.operator.vehicleNumber),
    //       ],
    //     ),
    //     TableRow(
    //       children: [
    //         paddedText("Pickup Location", bold: true),
    //         paddedText(data.value.routeId),
    //       ],
    //     ),
    //     TableRow(
    //       children: [
    //         paddedText("Drop Location", bold: true),
    //         paddedText(data.value.routeId),
    //       ],
    //     ),
    //     TableRow(
    //       children: [
    //         paddedText("Date", bold: true),
    //         paddedText(data.value.plannedStartTime ?? ""),
    //       ],
    //     ),
    //     TableRow(
    //       children: [
    //         paddedText("Status", bold: true),
    //         GetBuilder<TripControllers>(
    //           id: data.value.id,
    //           builder: (tripControllers) => statusInfoWidget(data.value.status),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  );
}

Widget textRow(String key, String value) => Row(
      children: [
        paddedText("$key\t\t", bold: true),
        Expanded(child: paddedText(value)),
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
