import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<SharedPreferences> get _prefs async =>
      SharedPreferences.getInstance();

  static Future<void> setData(String key, dynamic value) async {
    final prefs = await _prefs;

    debugPrint('SharedPrefHelper -> setData | key: $key | value: $value');

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      throw UnsupportedError('Type ${value.runtimeType} is not supported');
    }
  }

  static Future<String> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  static Future<int> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key) ?? 0;
  }

  static Future<double> getDouble(String key) async {
    final prefs = await _prefs;
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future<bool> getBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key) ?? false;
  }

  static Future<void> removeData(String key) async {
    final prefs = await _prefs;

    debugPrint('SharedPrefHelper -> removeData | key: $key');

    await prefs.remove(key);
  }

  static Future<void> clearAllData() async {
    final prefs = await _prefs;

    debugPrint('SharedPrefHelper -> clearAllData');

    await prefs.clear();
  }

  // =========================
  // Secure Storage
  // =========================

  static Future<void> setSecuredString(String key, String value) async {
    debugPrint('SecureStorage -> write | key: $key');

    await _secureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  static Future<void> removeSecuredData(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearAllSecuredData() async {
    debugPrint('SecureStorage -> clearAllSecuredData');

    await _secureStorage.deleteAll();
  }

  static Future<void> clearSecureStorgeOnFirstRun() async {
    final pref = await _prefs;
    final isFirstRun = pref.get(SharedPrefKey.isFirstRun);
    if (isFirstRun == null) {
      await _secureStorage.deleteAll();
      await pref.setBool(SharedPrefKey.isFirstRun, true);
    }
  }
}
