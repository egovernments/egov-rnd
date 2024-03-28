import 'package:dio/dio.dart';
import 'package:new_digit_app/data/api_interceptors.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import '../utils/envConfig.dart';

class UserRepository {
  UserRepository();

  //fetch user details
  Future<Response> searchUser(String url, String uuid) async {
    final client = DioClient().dio;
    client.interceptors.add(AuthTokenInterceptor());

    try {
      final response = await client.post(url,
          queryParameters: {
            'offset': 0,
            'limit': 100,
            'tenantId': envConfig.variables.tenantId,
          },
          data: UserSearchModel(uuid: [uuid]).toMap());

      return response;
    } catch (err) {
      rethrow;
    }
  }

  //send the new details to the api
  Future<Response> updateUser(String url, UserModel user) async {
    final client = DioClient().dio;
    final headers = <String, String>{
      "content-type": 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
      "content-length": "0"
    };

    try {
      final response = await client.post(url, queryParameters: {
        'offset': 0,
        'limit': 100,
        'tenantId': envConfig.variables.tenantId,
      }, data: {
        "user": user.toMap()
      });
      return response;
    } catch (err) {
      rethrow;
    }
  }
}
