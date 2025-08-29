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

  Future<String?> getSharedPreferences({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = await prefs.getString(key);
    return data;
  }

  Future<bool> deleteSharedPreferences({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    return true;
  }
}
