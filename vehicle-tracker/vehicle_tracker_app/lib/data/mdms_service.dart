import 'dart:developer';

import 'package:vehicle_tracker_app/data/hive_service.dart';

import '../models/mdms/mdms_hive/mdms_hive_model.dart';
import '../models/mdms/mdms_model/mdms_model.dart';
import 'http_service.dart';

class MdmsService {
  static List<MdmsHiveModel> mdmsHiveModelList = [];

  static Future<void> fetchMdmsData() async {
    var data = HiveService.getMdmsData();

    // If the list empty, call API
    if (data.isEmpty) {
      // Call API
      log("Calling API for mdms data");
      final apiData = await MdmsService.callMdmsAPI();
      if (apiData == null) {
        log("API data for mdms is null");
        return;
      }

      // Save to local storage
      log("Storing of mdms data to local storage");
      final hiveData = await HiveService.storeMdmsData(apiData);

      mdmsHiveModelList.addAll(hiveData);
    } else {
      log("Fetching mdms data from local storage");
      mdmsHiveModelList.addAll(data);
    }
  }

  static Future<MdmsResponse?> callMdmsAPI() async {

    const url= "https://unified-dev.digit.org/egov-mdms-service/v1/_search?tenantId=pg";

    var response = await HttpService.getRequestWithoutToken(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = response.body;
      return MdmsResponse.fromJson(json);
    } else {
      return null;
    }
  }
}