import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

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
      child: Padding(
        padding: theme.buttonPadding * 0.65,
        child: infoBuilder(status, theme),
      ),
    ),
  );
}

Color colourPicker(String status, DigitTheme theme) {
  switch (status) {
    case TripStates.NOTSTARTED:
      return theme.colors.paleRose;
    case TripStates.COMPLETED:
      return theme.colors.tropicalBlue;
    default:
      return theme.colors.paleLeafGreen;
  }
}

Widget infoBuilder(String status, DigitTheme theme) {
  final textTheme = theme.mobileTheme.textTheme.bodyLarge;

  switch (status) {
    case TripStates.NOTSTARTED:
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error,
            color: theme.colors.lavaRed,
            size: 20,
          ),
          const SizedBox(width: 2),
          Text(
            AppTranslation.NOT_STARTED_STATUS.tr,
            style: textTheme?.copyWith(
              color: theme.colors.lavaRed,
            ),
          ),
        ],
      );

    case TripStates.COMPLETED:
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.thumb_up,
            color: theme.colors.waterBlue,
            size: 20,
          ),
          const SizedBox(width: 2),
          Text(
            AppTranslation.COMPLETED_TRIP_STATUS.tr,
            style: textTheme?.copyWith(
              color: theme.colors.waterBlue,
            ),
          ),
        ],
      );

    default:
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: theme.colors.darkSpringGreen,
            size: 20,
          ),
          const SizedBox(width: 2),
          Text(
            AppTranslation.ON_GOING_STATUS.tr,
            style: textTheme?.copyWith(
              color: theme.colors.darkSpringGreen,
            ),
          ),
        ],
      );
  }
}
