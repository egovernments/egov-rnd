import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await Future.wait([
      delete(TOKEN),
      delete(UUID),
      delete(TENANT_ID),
      delete(OPERATOR_ID),
    ]);

    log("All data deleted from secure storage");
  }

  static Future<void> writeAll({
    required String token,
    required String uuid,
    required String tenantId,
    required String operatorId,
  }) async {
    await Future.wait([
      write(TOKEN, token),
      write(UUID, uuid),
      write(TENANT_ID, tenantId),
      write(OPERATOR_ID, operatorId),
    ]);

    log("All data written to secure storage");
  }
}
