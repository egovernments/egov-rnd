import 'dart:developer';

import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/inbox/controllers/header_controllers.dart';
import 'package:vehicle_tracker_app/services/http_service.dart';
import 'package:vehicle_tracker_app/services/token_service.dart';

class InboxControllers extends GetxController {
  RxBool isLoaded = false.obs;
  HeaderControllers headerControllers = Get.find<HeaderControllers>();

  @override
  void onInit() {
    super.onInit();
    getInbox();
  }

  getInbox() async {
    isLoaded.value = true;

    log("Calling Request");

    Map<String, dynamic> body = {
      "RequestInfo": {
        "apiId": "Rainmaker",
        "authToken": await SecureStorageService.read() ?? "",
        "msgId": "1688975382330|en_IN",
        "plainAccessRequest": {}
      }
    };

    String route = "location/v11/boundarys/_search?hierarchyTypeCode=REVENUE&boundaryType=Locality&tenantId=pg.cityb";

    Response response = await HttpService.postRequestWithoutToken(route, body);

    log("Response Code ${response.statusCode}");
    log("Response Boyd ${response.body}");

    isLoaded.value = false;
  }
}
