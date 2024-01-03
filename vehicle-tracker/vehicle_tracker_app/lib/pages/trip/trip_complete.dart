import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../widgets/trip/trip_info_widget.dart';

class TripCompletepage extends StatelessWidget {
  const TripCompletepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: DigitTheme.instance.buttonPadding,
        child: Column(
          children: [
            const TripInfoWidget(title: "title", description: "description", isCompleted: false),
            const Text("The Data has been recorded successfully"),
            DigitElevatedButton(child: const Text("Back to my Trips"), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}


