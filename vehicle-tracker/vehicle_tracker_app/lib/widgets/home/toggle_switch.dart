import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vehicle_tracker_app/blocs/home/controllers/info_controllers.dart';

Widget toggler(BuildContext context, InfoController infoController) {
  final theme = DigitTheme.instance;

  return ToggleSwitch(
    initialLabelIndex: 0,
    totalSwitches: 2,
    labels: const ['In Progress', 'Completed'],
    onToggle: (index) {
      if (index == 0) {
        infoController.isCompleted.value = false;
      } else {
        infoController.isCompleted.value = true;
      }
    },
    activeBgColor: [theme.colors.white],
    activeFgColor: theme.colors.mangoOrange,
    inactiveBgColor: theme.colors.white,
    inactiveFgColor: theme.colors.cloudGray,
    minWidth: double.infinity,
    minHeight: 35,
    customTextStyles: const [
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ],
    cornerRadius: 0,
    activeBorders: [
      Border.all(
        color: theme.colors.mangoOrange,
        width: 2,
      )
    ],
  );
}
