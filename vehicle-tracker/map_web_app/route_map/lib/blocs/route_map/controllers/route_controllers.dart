import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../constants.dart';
import '../../../data/http_service.dart';
import '../../../models/trip_progress/progress_report_model.dart';

class RouteControllers extends GetxController {
  final String tripId;

  RouteControllers(this.tripId);

  late Timer _timer;
  RxList<ProgressReportModel> progressReportList = <ProgressReportModel>[].obs;
  RxBool isFetching = false.obs;
  RxList<LatLng> polyPoints = <LatLng>[].obs;

  // void startPolling() {
  //   _timer = Timer.periodic(
  //     const Duration(seconds: 10),
  //     (timer) async {
  //       await fetchData();
  //     },
  //   );
  // }

  void stopPolling() {
    _timer.cancel();
  }

  Future<void> fetchData(String tripId) async {
    isFetching.value = true;

    String url = "$apiUrl/trip/_progress/_search?tripId=$tripId";

    final response = await HttpService.getRequest(url);
    if (response.statusCode == 200) {
      final data = response.body as List<dynamic>;
      for (var item in data) {
        final progressReport = ProgressReportModel.fromJson(item);
        progressReportList.add(progressReport);
      }
    }

    for (var item in progressReportList) {
      final list = item.location;
      if (list == null) {
        continue;
      }

      polyPoints.add(LatLng(list.latitude, list.longitude));
    }

    update();

    log("Polyline Points: ${polyPoints.length}");

    isFetching.value = false;
  }
}
