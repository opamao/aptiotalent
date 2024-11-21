import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Singleton pattern
  static final SharedPreferencesHelper _instance = SharedPreferencesHelper._internal();
  factory SharedPreferencesHelper() => _instance;

  SharedPreferencesHelper._internal();

  // Initialize SharedPreferences instance
  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Method to save a string value
  Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // Method to get a string value
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  // Method to remove a value
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  // Method to clear all values
  Future<void> clear() async {
    await _preferences?.clear();
  }
}