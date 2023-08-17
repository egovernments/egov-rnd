import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/repository/home_http_repository.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';

class InfoController extends GetxController {
  RxBool isCompleted = false.obs;
  RxBool isLoading = false.obs;
  RxBool isTextControllerEmpty = true.obs;
  final normalTripList = Rx<List<Rx<HomeTripModel>>>([]);
  final filteredNormalTripList = Rx<List<Rx<HomeTripModel>>>([]);
  final completedTripList = Rx<List<Rx<HomeTripModel>>>([]);
  final filteredCompletedTripList = Rx<List<Rx<HomeTripModel>>>([]);
  HomeHTTPRepository homeHTTPRepository = HomeHTTPRepository();
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getHomeTripData("rajan123");
  }

  // ? Function to call the API to get all the Trips Data.
  Future<void> getHomeTripData(String userId) async {
    await fillList(userId);
  }

  Future<void> fillList(String userId) async {
    isLoading.toggle();
    final totalList = await homeHTTPRepository.getHomeTripData(userId);

    normalTripList.value = totalList.where((element) {
      return element.value.status != "Completed" && element.value.status != "completed";
    }).toList();

    completedTripList.value = totalList.where((element) {
      return element.value.status == "Completed" || element.value.status == "completed";
    }).toList();

    isLoading.toggle();
  }

  // ? The original list is filtered based on the search text (Name or Contact Number).
  // ? The filtered list is assigned to the filteredHomeTripModel.
  // ? It ensures that the original list is not modified.
  // ? The original list is used when the search text is empty.
  // ? The filtered list is used when the search text is not empty.
  void onChangedFilter(String value) {
    if (isCompleted.isTrue) {
      filteredCompletedTripList.value = completedTripList.value.where((element) {
        bool name = element.value.operator.name.toLowerCase().contains(value.toLowerCase());
        bool contactNumber = element.value.operator.contactNumber.contains(value);
        return name || contactNumber;
      }).toList();
      return;
    } else {
      filteredNormalTripList.value = normalTripList.value.where((element) {
        bool name = element.value.operator.name.toLowerCase().contains(value.toLowerCase());
        bool contactNumber = element.value.operator.contactNumber.contains(value);
        return name || contactNumber;
      }).toList();
    }
  }
}
