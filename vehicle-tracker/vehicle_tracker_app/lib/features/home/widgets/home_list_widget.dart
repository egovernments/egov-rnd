import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/map_controllers.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mapControllers = Get.find<MapControllers>();

    return DigitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Locality Heading
          Text("-- Locality Name --"),
        ],
      ),
    );
  }
}

wordButton(String text, Function() onPressed) {
  return TextButton(
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: const EdgeInsets.all(1),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}
