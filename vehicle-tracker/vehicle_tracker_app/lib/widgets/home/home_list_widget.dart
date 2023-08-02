import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../blocs/home/controllers/inbox_controllers.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inboxController = Get.find<InboxController>();
    final width = MediaQuery.of(context).size.width;

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

              Row(
                children: [
                  SizedBox(
                    width: width * 0.35,
                    child: Text(
                      AppTranslation.NAME_INFO.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text("-- Name --"),
                ],
              ),

              const SizedBox(height: 7),

              Row(
                children: [
                  SizedBox(
                    width: width * 0.35,
                    child: Text(
                      AppTranslation.MOBILE_NUMBER.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text("-- Number --"),
                ],
              ),

              const SizedBox(height: 7),

              // ! Have to reverse the direction of arrow position
              DigitIconButton(
                iconText: AppTranslation.VIEW_DETAILS.tr,
                icon: Icons.arrow_forward,
                onPressed: () => Get.toNamed(INFO),
              ),

              const SizedBox(height: 7),

              // ! change after API integration
              inboxController.isCompleted.value
                  ? Center(
                      child: DigitOutLineButton(
                      label: AppTranslation.END_TRIP.tr,
                      onPressed: () {},
                    ))
                  : DigitElevatedButton(
                      child: Text(AppTranslation.START_TRIP.tr),
                      onPressed: () {},
                    ),
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
