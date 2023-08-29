import 'dart:async';

import 'package:get/get_state_manager/get_state_manager.dart';

class RouteControllers extends GetxController {
  late Timer _timer;

  void startPolling() {
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) async {
        await fetchData();
      },
    );
  }

  void stopPolling() {
    _timer.cancel();
  }

  Future<void> fetchData() async {}
}
