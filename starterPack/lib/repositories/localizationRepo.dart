import 'package:dio/dio.dart';

import '../model/localization/localizationModel.dart';
import '../model/request/requestInfo.dart';
import '../utils/constants.dart';

class LocalizationRepository {
  final client = Dio();

  Future<LocalizationModel> getLocalizationsList(
      Map<String, String> queryParameters) async {
    try {
      client.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        options.data = {
          ...options.data,
          "RequestInfo": RequestInfoModel(
            apiId: RequestInfoData.apiId,
            ver: RequestInfoData.ver,
            ts: DateTime.now().millisecondsSinceEpoch,
            action: options.path.split('/').last,
            did: RequestInfoData.did,
            key: RequestInfoData.key,
          ).toJson(),
        };
        return handler.next(options);
      }));
      final response = await client.post(
          'https://unified-qa.digit.org/localization/messages/v1/_search',
          queryParameters: queryParameters,
          data: {});

      final responseBody = LocalizationModel.fromJson(response.data);

      return responseBody;
    } catch (err) {
      rethrow;
    }
  }
}
