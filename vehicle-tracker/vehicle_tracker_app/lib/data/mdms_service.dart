import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_tracker_app/models/mdms/mdms_model.dart';

import 'http_service.dart';

class MdmsService {
  static fetchMdmsData() async {
    var data = await MdmsService.callMdmsAPI();
    if (data == null) {
      return;
    }

    log(data.toString());
  }

  static Future<MdmsModel?> callMdmsAPI() async {
    final env = dotenv.env["MDMS_URL"];

    var response = await HttpService.getRequestWithoutToken(env!);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = response.body;
      return MdmsModel.fromJson(json);
    } else {
      return null;
    }
  }
}
