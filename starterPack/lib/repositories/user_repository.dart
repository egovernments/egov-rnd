import 'package:dio/dio.dart';
import 'package:starterPack/data/api_interceptors.dart';
import 'package:starterPack/data/remote_client.dart';
import 'package:starterPack/model/user/userModel.dart';
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
