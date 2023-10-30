import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class MapLegendsWidget extends StatelessWidget {
  const MapLegendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;
    final textTheme = DigitTheme.instance.mobileTheme.textTheme;

    return Padding(
      padding: theme.buttonPadding,
      child: DigitCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Legends", style: textTheme.headlineMedium),
            legendItem("Alert Locations", theme.colors.lavaRed, Icons.local_activity),
            legendItem("Illegal Dumping Sites", theme.colors.paleRose, Icons.square),
            legendItem("FSTP Geo-Fence Area", theme.colors.pacificBlue, Icons.square),
            legendItem("Stop Locations", theme.colors.lavaRed, Icons.warning),
            legendItem("Pickup Location", theme.colors.curiousBlue, Icons.warehouse),
            legendItem("End Trip Location", theme.colors.curiousBlue, Icons.fire_truck),
            legendItem("Vehicle Route", theme.colors.curiousBlue, Icons.horizontal_rule),
          ],
        ),
      ),
    );
  }
}

Widget legendItem(String title, Color color, IconData icon) {
  return Padding(
    padding: DigitTheme.instance.verticalMargin,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 10),
        Text(title),
      ],
    ),
  );
}
