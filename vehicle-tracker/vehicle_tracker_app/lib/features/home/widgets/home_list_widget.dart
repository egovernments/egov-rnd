import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../map/controllers/map_controllers.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mapControllers = Get.find<MapControllers>();

    return DigitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 8.0),
              const Text("Fecal Sludge Management", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              Container(
                color: Colors.orange,
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.local_shipping, color: Colors.white, size: 48),
              ),
            ],
          ),
          const Divider(height: 1, thickness: 2),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("120", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Total", style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(width: 24.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("24", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Nearing SLA", style: TextStyle(fontSize: 16)),
                  ],
                )
              ],
            ),
          ),
          const Divider(height: 1, thickness: 2),
          const SizedBox(height: 6.0),
          wordButton("Inbox", () => Get.toNamed("/inbox")),
          wordButton("View Reports", () => mapControllers.startTracking(newDelhi, newDelhi)),
          wordButton("FSM Registry", () => null),
          wordButton("New Desulging Application", () => null),
          wordButton("Search Application", () => null),
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
