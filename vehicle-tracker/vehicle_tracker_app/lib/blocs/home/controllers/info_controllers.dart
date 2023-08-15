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
}
