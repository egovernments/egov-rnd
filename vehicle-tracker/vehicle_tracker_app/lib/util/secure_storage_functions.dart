import 'dart:developer';

import 'package:vehicle_tracker_app/constants.dart' as constants;

import '../data/secure_storage_service.dart';

class SecureStorageFunctions {
  static Future<void> writeAll(
      {required String username,
      required String password,
      required String token,
      required String uuid,
      required String tenantId}) async {

    await Future.wait([
      SecureStorageService.write(constants.userName, username),
      SecureStorageService.write(constants.userPassword, password),
      SecureStorageService.write(constants.token, token),
      SecureStorageService.write(constants.uuid, uuid),
      SecureStorageService.write(constants.tenantId, tenantId)
    ]);

    log("All data written to secure storage");

  }

  static Future<void> deleteAll() async {
    await Future.wait([
      SecureStorageService.delete(constants.userName),
      SecureStorageService.delete(constants.userPassword),
      SecureStorageService.delete(constants.token),
      SecureStorageService.delete(constants.uuid),
      SecureStorageService.delete(constants.tenantId)
    ]);

    log("All data deleted from secure storage");
  }
}
