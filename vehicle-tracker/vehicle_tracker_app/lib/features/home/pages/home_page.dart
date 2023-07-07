import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/place_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final placeController = Get.find<PlaceController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Tracker App"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              DigitOutLineButton(
                label: "Request",
                onPressed: () async {
                  await placeController.requestOnClick();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
