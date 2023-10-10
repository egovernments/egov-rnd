// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/constants.dart';

import '../../../data/http_service.dart';
import '../../../data/secure_storage_service.dart';
import '../../../models/login/login_data_model/login_data_model.dart';
import '../../../util/i18n_translations.dart';
import '../../../util/toaster.dart';

class LoginHTTPRepository {
  static Future<bool> login(BuildContext context, String username, String password, String city) async {
    try {
      Map<String, dynamic> formData = {
        "grant_type": "password",
        "scope": "read",
        "username": username.trim(),
        "password": password.trim(),
        "userType": "EMPLOYEE",
        "tenantId": city,
      };

      final response = await HttpService.postWithFormData(loginUrl, formData);
      if (response.statusCode == 200) {
        final loginModel = LoginDataModel.fromJson(response.body);

        await Future.wait([
          SecureStorageService.write(token, loginModel.access_token),
          SecureStorageService.write(uuid, loginModel.UserRequest.uuid),
          SecureStorageService.write(tenantId, loginModel.UserRequest.tenantId)
        ]);

        toaster(context, AppTranslation.LOGIN_SUCCESS_MESSAGE.tr);
        return true;  
      } else {
        toaster(context, AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
        return false;
      }
    } on FormatException catch (e) {
      toaster(context, e.message, isError: true);
      return false;
    } on Exception catch (e) {
      toaster(context, e.toString(), isError: true);
      return false;
    }
  }
}
