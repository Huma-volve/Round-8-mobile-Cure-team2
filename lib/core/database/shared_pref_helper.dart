import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  const SharedPrefHelper._();
  static SharedPreferences? _preferences;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Save a string value
  static Future<void> setString(String key, String? value) async {
    if (value == null) {
      removeKey(key);
    } else {
      await _preferences?.setString(key, value);
    }
  }

  /// Get a string value
  static String? getString(String key) {
    return _preferences?.getString(key);
  }

  /// Save an integer value
  static Future<void> setInt(String key, int? value) async {
    if (value == null) {
      removeKey(key);
    } else {
      await _preferences?.setInt(key, value);
    }
  }

  /// Get an integer value
  static int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  /// Save a boolean value
  static Future<void> setBool(String key, bool? value) async {
    if (value == null) {
      removeKey(key);
    } else {
      await _preferences?.setBool(key, value);
    }
  }

  /// Get a boolean value
  static bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  /// Save a double value
  static Future<void> setDouble(String key, double? value) async {
    if (value == null) {
      removeKey(key);
    } else {
      await _preferences?.setDouble(key, value);
    }
  }

  /// Get a double value
  static double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  /// Save a list of strings
  static Future<void> setStringList(String key, List<String>? value) async {
    if (value == null) {
      removeKey(key);
    } else {
      await _preferences?.setStringList(key, value);
    }
  }

  /// Get a list of strings
  static List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  /// Remove a key
  static Future<void> removeKey(String key) async {
    await _preferences?.remove(key);
  }

  /// Clear all stored data
  static Future<void> clearAll() async {
    await _preferences?.clear();
  }
}
