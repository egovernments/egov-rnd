import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';
import 'package:vehicle_tracker_app/widgets/home/status_info_widget.dart';

import '../../blocs/home/controllers/trip_tracker_controllers.dart';

Widget textColumnWidget(Rx<HomeTripModel> data) => Padding(
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
                paddedText(data.value.id),
                paddedText(data.value.operator.name),
                paddedText(data.value.operator.vehicleNumber),
                paddedText(data.value.routeId),
                paddedText(data.value.routeId),
                paddedText(data.value.plannedStartTime ?? ""),
                GetBuilder<TripControllers>(
                  id: data.value.id,
                  builder: (tripControllers) => statusInfoWidget(data.value.status),
                ),
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
