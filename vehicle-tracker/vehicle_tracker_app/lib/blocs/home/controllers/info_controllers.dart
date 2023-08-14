import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/repository/home_http_repository.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';

class InfoController extends GetxController {
  RxBool isCompleted = false.obs;
  RxBool isLoading = false.obs;
  RxBool isTextControllerEmpty = true.obs;
  final homeTripModel = Rx<List<Rx<HomeTripModel>>>([]);
  final filteredHomeTripModel = Rx<List<Rx<HomeTripModel>>>([]);
  HomeHTTPRepository homeHTTPRepository = HomeHTTPRepository();
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getHomeTripData("rajan123");
  }

  // ? Function to call the API to get all the Trips Data.
  Future<void> getHomeTripData(String userId) async {
    isLoading.toggle();
    homeTripModel.value = await homeHTTPRepository.getHomeTripData(userId);
    isLoading.toggle();
  }

  // ? The original list is filtered based on the search text (Name or Contact Number).
  // ? The filtered list is assigned to the filteredHomeTripModel.
  // ? It ensures that the original list is not modified.
  // ? The original list is used when the search text is empty.
  // ? The filtered list is used when the search text is not empty.
  void onChangedFilter(String value) {
    filteredHomeTripModel.value = homeTripModel.value.where((element) {
      bool name = element.value.operator.name.toLowerCase().contains(value.toLowerCase());
      bool contactNumber = element.value.operator.contactNumber.contains(value);
      return name || contactNumber;
    }).toList();
  }


  // ? DialogBox builder functions
  startTrip(BuildContext context) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleText: "Warning",
        titleIcon: const Icon(Icons.warning_rounded, color: Colors.red),
        contentText: "Start the trip only after reaching the pickup location.  Have you reached the applicant location?",
        primaryAction: DigitDialogActions(label: "Yes", action: (context) => Get.back()),
        secondaryAction: DigitDialogActions(label: "No", action: (context) => Get.back()),
      ),
    );
  }

  endTrip(BuildContext context, String locality) => DigitDialog.show(
        context,
        options: DigitDialogOptions(
          titleText: "Warning",
          titleIcon: const Icon(Icons.warning_rounded, color: Colors.red),
          contentText: "Are you sure to end the trip for $locality?",
          primaryAction: DigitDialogActions(label: "Yes", action: (context) => Get.back()),
          secondaryAction: DigitDialogActions(label: "No", action: (context) => Get.back()),
        ),
      );
}
