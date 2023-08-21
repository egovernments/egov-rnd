import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';

Widget statusInfoWidget(String status) {
  final theme = DigitTheme.instance;

  return Padding(
    padding: theme.verticalMargin,
    child: Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      color: colourPicker(status, theme),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: infoBuilder(status, theme)),
    ),
  );
}

Color colourPicker(String status, DigitTheme theme) {
  switch (status) {
    case TripStates.CREATED:
      return theme.colors.paleRose;
    case TripStates.COMPLETED:
      return theme.colors.tropicalBlue;
    default:
      return theme.colors.paleLeafGreen;
  }
}

Widget infoBuilder(String status, DigitTheme theme) {
  switch (status) {
    case TripStates.CREATED:
      return DigitIconButton(
        icon: Icons.error,
        iconColor: theme.colors.lavaRed,
        iconText: "Not Started",
        iconTextColor: theme.colors.lavaRed,
      );

    case TripStates.COMPLETED:
      return DigitIconButton(
        icon: Icons.thumb_up,
        iconColor: theme.colors.waterBlue,
        iconText: "Completed",
        iconTextColor: theme.colors.waterBlue,
      );

    default:
      return DigitIconButton(
        icon: Icons.check_circle,
        iconColor: theme.colors.darkSpringGreen,
        iconText: "On Going",
        iconTextColor: theme.colors.darkSpringGreen,
      );
  }
}
