import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class MapAppBarWidget extends StatelessWidget {
  const MapAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;

    return Padding(
      padding: theme.buttonPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          columnDataShower("Trip Duration", "1h 26m 57s"),
          columnDataShower("Start Time", "12:47"),
          columnDataShower("Distance Covered", "47km"),
          columnDataShower("Stopage Time", "43min")
        ],
      ),
    );
  }
}

Widget columnDataShower(String header, String info) {
  final textTheme = DigitTheme.instance.mobileTheme.textTheme;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(header, style: textTheme.labelMedium),
      Text(info, style: textTheme.displayMedium),
    ],
  );
}
