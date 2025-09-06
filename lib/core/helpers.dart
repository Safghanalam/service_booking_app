import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  Future<bool> saveSharedPreferences({
    required String key,
    required String value,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    return true;
  }

  // Return nullable String rather than data.toString()
  Future<String?> getSharedPreferences({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> deleteSharedPreferences({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    return true;
  }

  // helper to clear auth data at once
  Future<void> clearAuthData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user');
  }
}
