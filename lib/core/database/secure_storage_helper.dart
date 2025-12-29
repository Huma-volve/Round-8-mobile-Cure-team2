import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  /// get secure string
  static Future<String?> getSecureString(String key) async {
    return await _storage.read(key: key);
  }

  ///save secure string
  static Future<void> setSecureString(String key, String value) async {
    return await _storage.write(key: key, value: value);
  }

  ///remove key
  static Future<void> deleteSecureString(String key) async {
    return await _storage.delete(key: key);
  }
}
