import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static final SecureStorage secureStorage = SecureStorage._();

  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> setSecuredData(String key, String value) async {
    debugPrint('FlutterSecureStorage : setSecuredData with key : $key');
    await storage.write(key: key, value: value);
  }

  static Future<String> getSecuredData(String key) async {
    debugPrint('FlutterSecureStorage : getSecuredData with key : $key');
    return await storage.read(key: key) ?? '';
  }

  static Future<void> removeSecuredData(String key) async {
    debugPrint('FlutterSecureStorage : removeSecuredData with key : $key');
    await storage.delete(key: key);
  }

  static Future<void> clearAllData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    await storage.deleteAll();
  }
}
