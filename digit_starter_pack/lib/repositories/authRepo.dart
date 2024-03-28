import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/login/loginModel.dart';
import 'package:new_digit_app/model/request/requestInfo.dart';
import 'package:new_digit_app/model/response/responsemodel.dart';
import 'package:new_digit_app/model/role_actions/role_actions_model.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';
import 'package:new_digit_app/utils/constants.dart';

class AuthRepository {
  AuthRepository();
  final client = DioClient().dio;

  Future<ResponseModel> validateLogin(String url, LoginModel body) async {
    final formData = body.toJson();

    //make a custom Dio client which will not send the request with the interceptor
    final authClient = Dio();
    authClient.options.baseUrl = envConfig.variables.baseUrl;

    final headers = <String, String>{
      "content-type": 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
    };

    try {
      final response = await authClient.post(url,
          data: formData, options: Options(headers: headers));
      final responseBody = ResponseModel.fromJson(response.data);

      //close this client so it doesnt interfere with other instances of DioClient
      authClient.close();

      return responseBody;
    } catch (err) {
      rethrow;
    }
  }

  Future<RoleActionsWrapperModel> searchRoleActions(
    Map<String, dynamic> body,
  ) async {
    String url = envConfig.variables.actionMapApiPath;

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

      final Response response = await client.post(url, data: body);
      return RoleActionsWrapperModel.fromJson(json.decode(response.toString()));
    } catch (_) {
      rethrow;
    }
  }
}
