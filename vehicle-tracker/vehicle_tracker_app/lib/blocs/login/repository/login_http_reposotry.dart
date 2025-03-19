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
// sendOtp

  static Future<bool> sendOtp(BuildContext context,
      {required String mobileNumber}) async {
    try {
      final sendOtpUrl = "$unifiedDevApiUrl/user-otp/v1/_send";

      Map<String, dynamic> formData = {
        "otp": {
          "mobileNumber": mobileNumber,
          "tenantId": "pg",
          "type": "login",
          "userType": "citizen"
        }
      };

      final response = await HttpService.postRequest(sendOtpUrl, formData);
      if (response.statusCode != 200) {
        log("Error Code: ${response.statusCode}");
        toaster(AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
        return false;
      }
      return response.body['isSuccessful'] as bool;
    } catch (e) {
      return false;
    }
  }

//

  static Future<bool> login(String username,
      String password, String city) async {
    try {
      final loginUrl = "$unifiedDevApiUrl/user/oauth/token";

      Map<String, dynamic> formData = {
        "grant_type": "password",
        "scope": "read",
        "username": username.trim(),
        "password": password.trim(),
        "userType": "citizen",
        "tenantId": city,
      };

      final response = await HttpService.postWithFormData(loginUrl, formData);
      if (response.statusCode != 200) {
        log("Error Code: ${response.statusCode}");
        toaster(AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
        return false;
      }

      final loginModel = LoginDataModel.fromJson(response.body);
      final data = await SecureStorageService.read(CITYCODE);
      final driverId = await getDriverId(
          loginModel.access_token, loginModel.UserRequest.uuid, data.toString(),
          mobileNumber: username.trim());
      if (driverId == "") {
        toaster(AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
        return false;
      }

      await SecureStorageService.writeAll(
        token: loginModel.access_token,
        uuid: loginModel.UserRequest.uuid,
        tenantId: data.toString(),
        operatorId: driverId,
      );

      await HiveService.addUserData(
          loginModel.UserRequest.name, loginModel.UserRequest.mobileNumber);

      toaster(AppTranslation.LOGIN_SUCCESS_MESSAGE.tr, isError: false);
      return true;
    } on FormatException catch (e) {
      log("Error: ${e.message}");
      toaster(AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
      return false;
    } on Exception catch (e) {
      log("Error: ${e.toString()}");
      toaster(AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
      return false;
    }
  }

  static Future<String> getDriverId(
      String authToken, String uuid, String tenantId,
      {required String mobileNumber}) async {
    try {
      final url = "$unifiedDevApiUrl/individual/v1/_search";
      final loginUrl = "$url?tenantId=$tenantId&offset=0&limit=1";

      Map<String, dynamic> body = {
        "Individual": {"mobileNumber": [mobileNumber]},
        "RequestInfo": {
          "apiId": "Rainmaker",
          "authToken": authToken,
        }
      };

      final response = await HttpService.postRequest(loginUrl, body);
      if (response.statusCode != 200) {
        log("Error in getting Individual id : ${response.statusCode}");
        return "";
      }

      return response.body["Individual"][0]["id"];
    } catch (e) {
      log("Error in getting Individual id : ${e.toString()}");
      return "";
    }
  }
}
