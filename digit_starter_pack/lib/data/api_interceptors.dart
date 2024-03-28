import 'package:dio/dio.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/utils/constants.dart';

import '../model/request/requestInfo.dart';

class AuthTokenInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final secureStore = SecureStore();
    final authToken = await secureStore.getAccessToken();

    if (options.data is Map) {
      options.data = {
        ...options.data,
        "RequestInfo": RequestInfoModel(
          apiId: RequestInfoData.apiId,
          ver: RequestInfoData.ver,
          ts: DateTime.now().millisecondsSinceEpoch,
          action: options.path.split('/').last,
          did: RequestInfoData.did,
          key: RequestInfoData.key,
          authToken: authToken,
        ).toJson(),
      };
    }
    return super.onRequest(options, handler);
  }
}
