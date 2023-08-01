import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../blocs/home/controllers/inbox_controllers.dart';
import '../../blocs/home/controllers/map_controllers.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mapControllers = Get.find<MapControllers>();
    final inboxController = Get.find<InboxController>();

    return Obx(
      () => DigitCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Locality Heading
              const Text("-- Locality Name --"),

              const SizedBox(height: 10),

              const Row(
                children: [
                  Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 86),
                  Text("-- Name --"),
                ],
              ),

              const SizedBox(height: 7),

              const Row(
                children: [
                  Text("Mobile Number", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 20),
                  Text("-- Number --"),
                ],
              ),

              const SizedBox(height: 7),

              // ! Have to reverse the direction of arrow position
              DigitIconButton(
                iconText: "View Details",
                icon: Icons.arrow_forward,
                onPressed: () {},
              ),

              const SizedBox(height: 7),

              // ! change after API integration
              inboxController.isCompleted.value
                  ? Center(child: DigitOutLineButton(label: "End Trip", onPressed: () {}))
                  : DigitElevatedButton(child: const Text("Start Trip"), onPressed: () {}),
            ],
          ),
        ),
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
