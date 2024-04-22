import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:starterPack/data/remote_client.dart';
import 'package:starterPack/model/login/loginModel.dart';
import 'package:starterPack/model/response/responsemodel.dart';
import 'package:starterPack/model/role_actions/role_actions_model.dart';
import 'package:starterPack/repositories/app_init_Repo.dart';
import 'package:starterPack/utils/constants.dart';

class AuthRepository {
  AuthRepository();
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
    final client = DioClient().dio;
    
    try {
      final Response response = await client.post(url, data: body);
      return RoleActionsWrapperModel.fromJson(json.decode(response.toString()));
    } catch (_) {
      rethrow;
    }
  }
}
