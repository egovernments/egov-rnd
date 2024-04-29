import 'package:dio/dio.dart';
import 'package:starterPack/data/remote_client.dart';

import '../model/localization/localizationModel.dart';
import '../model/request/requestInfo.dart';
import '../utils/constants.dart';

class LocalizationRepository {
  final client = DioClient().dio;
  final path = Constants.localizationApiPath;
  Future<LocalizationModel> getLocalizationsList(
      Map<String, String> queryParameters) async {
    final response =
        await client.post(path, queryParameters: queryParameters, data: {});

    final responseBody = LocalizationModel.fromJson(response.data);

    return responseBody;
  }
}
