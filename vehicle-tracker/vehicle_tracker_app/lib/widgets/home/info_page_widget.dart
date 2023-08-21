import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';

Widget textColumnWidget(HomeTripModel data) => Padding(
      padding: DigitTheme.instance.verticalMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddedText('Trip ID', bold: true),
              paddedText('Name', bold: true),
              paddedText('Vehicle Number', bold: true),
              paddedText("Pickup Location", bold: true),
              paddedText("Drop Location", bold: true),
              paddedText("Date", bold: true),
              paddedText("Status", bold: true)
            ],
          ),
          const Spacer(),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                paddedText(data.id),
                paddedText(data.operator.name),
                paddedText(data.operator.vehicleNumber),
                paddedText(data.routeId),
                paddedText(data.routeId),
                paddedText(data.plannedStartTime ?? ""),
                paddedText(data.status),
              ],
            ),
          ),
        ],
      ),
    );

Widget paddedText(String value, {bool bold = false}) => Padding(
      padding: DigitTheme.instance.verticalMargin,
      child: Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: bold ? const TextStyle(fontWeight: FontWeight.bold) : null,
      ),
    );
