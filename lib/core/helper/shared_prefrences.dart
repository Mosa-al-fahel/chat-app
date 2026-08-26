import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._();
  static late SharedPreferences _prefs;

  static Future<void> initializeSharedPerefrnce() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> clearAll() {
    return _prefs.clear();
  }

  static Future<bool> clearShared(String key) {
    return _prefs.remove(key);
  }

  static String? sharedString(String key) {
    return  _prefs.getString(key);
  }

  static int? sharedInt(String key) {
    return _prefs.getInt(key);
  }

  static bool? sharedBool(String key) {
    return _prefs.getBool(key);
  }

  static Future<void> setData(String key, value) async {
    switch (value.runtimeType) {
      case String:
        await _prefs.setString(key, value);
        break;
      case int:
        await _prefs.setInt(key, value);
        break;
      case double:
        await _prefs.setDouble(key, value);
        break;
      case bool:
        await _prefs.setBool(key, value);
        break;
    }
  }
}
