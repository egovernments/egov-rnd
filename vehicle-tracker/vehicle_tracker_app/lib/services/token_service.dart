import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static Future<void> write(String value) async {
    await _storage.write(key: "token", value: value);
  }

  static Future<String?> read() async {
    return await _storage.read(key: "token");
  }

  static Future<void> delete() async {
    await _storage.delete(key: "token");
  }
}