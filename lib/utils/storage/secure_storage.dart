import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_events/utils/constants/api_keys.dart';

class SecureStorage {
  // Create storage
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = FkApiKeys.secureStorageToken;

  // Save token
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  // Get token
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // Clear token
  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }
}
