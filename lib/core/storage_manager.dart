// ignore_for_file: void_print

import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static void savedData(String key, dynamic value) async {
    final pref = await SharedPreferences.getInstance();

    if (value is int) {
      pref.setInt(key, value);
    } else if (value is String) {
      pref.setString(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else if (value is List<String>) {
      pref.setStringList(key, value);
    }
  }

  static Future<dynamic> readData(String key) async {
    final pref = await SharedPreferences.getInstance();
    dynamic obj = pref.get(key);
    return obj;
  }
   static Future<dynamic> readStringListData(String key) async {
    final pref = await SharedPreferences.getInstance();
    List<String>? list = pref.getStringList(key);
    return list;
  }

  static Future<bool> deleteData(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}
