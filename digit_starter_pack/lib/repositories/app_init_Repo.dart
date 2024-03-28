import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/appconfig/mdmsRequest.dart';
import 'package:new_digit_app/model/appconfig/mdmsResponse.dart';
import 'package:new_digit_app/model/serviceRegistry/serviceRegistryModel.dart';
import 'package:new_digit_app/utils/constants.dart';

import '../model/request/requestInfo.dart';
import '../utils/envConfig.dart';

//create an instance of the environmentConfiguration class
//envConfig is used everywhere to get certain variables, either from the .env file or by using certain predefined fallback values
EnvironmentConfiguration envConfig = EnvironmentConfiguration.instance;

class AppInitRepo {
  Future<MdmsResponseModel> searchAppConfiguration(
      MdmsRequestModel mdmsRequestBody) async {
    final client = Dio();
    final body = mdmsRequestBody.toJson();

    final SecureStore storage = SecureStore();

    // try to fetch locally
    String? localAppConfig = await storage.getAppConfig();
    if (localAppConfig != null) {
      return MdmsResponseModel.fromJson(json.decode(localAppConfig));
    }

    final headers = <String, String>{
      // "content-type": 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
    };

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

      //make am api call
      final response = await client.post(envConfig.variables.completeMdmsApiUrl,
          data: body, options: Options(headers: headers));

      final responseBody = MdmsResponseModel.fromJson(
        json.decode(response.toString())['MdmsRes'],
      );

      //storage locally to avoid fetching in future
      storage.setAppConfig(responseBody);

      return responseBody;
    } catch (err) {
      rethrow;
    }
  }

  Future<ServiceRegistryModel> searchServiceRegistry(
    Map<String, dynamic> body,
  ) async {
    final SecureStore storage = SecureStore();

    // try to fetch locally
    String? localServiceRegistry = await storage.getServiceRegistry();
    if (localServiceRegistry != null) {
      return ServiceRegistryModel.fromJson(json.decode(localServiceRegistry));
    }

    //fetch from the mdms
    final client = Dio();

    final headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
    };

    //this request needs an interceptor to add RequestInfo
    try {
      client.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        options.data = {
          ...options.data,
          "RequestInfo": RequestInfoModel(
            apiId: 'hcm',
            ver: '0.1',
            ts: DateTime.now().millisecondsSinceEpoch,
            action: options.path.split('/').last,
            did: "1",
            key: "1",
          ).toJson(),
        };
        return handler.next(options);
      }));

      //make an api call
      final response = await client.post(envConfig.variables.completeMdmsApiUrl,
          data: body, options: Options(headers: headers));

      final responseBody = ServiceRegistryModel.fromJson(
          json.decode(response.toString())['MdmsRes']);

      //store locally to avoid fetching online in future
      storage.setServiceRegistry(responseBody);

      return responseBody;
    } catch (_) {
      rethrow;
    }
  }
}
