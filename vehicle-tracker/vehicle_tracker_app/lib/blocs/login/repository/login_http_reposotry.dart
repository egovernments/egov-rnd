// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/data/hive_service.dart';

import '../../../data/http_service.dart';
import '../../../data/secure_storage_service.dart';
import '../../../models/login/login_data_model/login_data_model.dart';
import '../../../util/i18n_translations.dart';
import '../../../util/toaster.dart';

class LoginHTTPRepository {
  static Future<bool> login(BuildContext context, String username, String password, String city) async {
    try {
      final loginUrl = "$unifiedDevApiUrl/user/oauth/token";

      Map<String, dynamic> formData = {
        "grant_type": "password",
        "scope": "read",
        "username": username.trim(),
        "password": password.trim(),
        "userType": "EMPLOYEE",
        "tenantId": city,
      };

      final response = await HttpService.postWithFormData(loginUrl, formData);
      if (response.statusCode != 200) {
        log("Error Code: ${response.statusCode}");
        toaster(context, AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
        return false;
      }

      final loginModel = LoginDataModel.fromJson(response.body);

      final driverId = await getDriverId(loginModel.access_token, loginModel.UserRequest.uuid, "pg.citya");
      if (driverId == "") {
        toaster(context, AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
        return false;
      }

      await SecureStorageService.writeAll(
        token: loginModel.access_token,
        uuid: loginModel.UserRequest.uuid,
        tenantId: loginModel.UserRequest.tenantId,
        operatorId: driverId,
      );

      await HiveService.addUserData(loginModel.UserRequest.name, loginModel.UserRequest.mobileNumber);

      toaster(null, AppTranslation.LOGIN_SUCCESS_MESSAGE.tr);
      return true;
    } on FormatException catch (e) {
      log("Error: ${e.message}");
      toaster(context, AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
      return false;
    } on Exception catch (e) {
      log("Error: ${e.toString()}");
      toaster(context, AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
      return false;
    }
  }

  static Future<String> getDriverId(String authToken, String uuid, String tenantId) async {
    try {
      final url = "$unifiedDevApiUrl/vendor/driver/v1/_search";
      final loginUrl = "$url?tenantId=$tenantId&ownerIds=$uuid";

      Map<String, dynamic> body = {
        "RequestInfo": {
          "apiId": "Rainmaker",
          "authToken": authToken,
        }
      };

      final response = await HttpService.postRequest(loginUrl, body);
      if (response.statusCode != 200) {
        log("Error in getting driver id : ${response.statusCode}");
        return "";
      }

      return response.body["driver"][0]["id"];
    } catch (e) {
      log("Error in getting driver id : ${e.toString()}");
      return "";
    }
  }
}
