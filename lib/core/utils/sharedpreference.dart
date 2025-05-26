import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreference {
  static SharedPreferences? sharedPreferences;

  ///Initialize SharedPref data
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ///Save any data into sharedpref
  static Future<bool> saveData({
    required String? key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key!, value);
    if (value is int) return await sharedPreferences!.setInt(key!, value);
    if (value is bool) return await sharedPreferences!.setBool(key!, value);

    return await sharedPreferences!.setDouble(key!, value);
  }

  ///Get data from sharedpref
  static Future<dynamic> getData({
    required String key,
  }) async {
    return sharedPreferences?.get(key);
  }

  ///Remove data from sharedpref
  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }

  ///Clear ALL THE DATA from sharedpref
  static Future<bool> clearAllData() async {
    return await sharedPreferences!.clear();
  }
}
