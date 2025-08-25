import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveToken({required String value}) {
    sharedPreferences.setString('token', value);
  }

  static void driverId({required String value}) {
    sharedPreferences.setString('driverId', value);
  }

  //delete token
  static void deleteToken() {
    sharedPreferences.remove('token');
  }

  static void deleteDriverId() {
    sharedPreferences.remove('driverId');
  }

  static String? getToken() {
    return sharedPreferences.getString('token');
  }

  static String? getDriverId() {
    return sharedPreferences.getString('driverId');
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  static Future<void> saveLanguageCode(String code) async {
    await sharedPreferences.setString('languageKey', code);
  }

  static String getSavedLanguageCode() {
    return sharedPreferences.getString('languageKey') ?? 'en';
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value ?? 0.0);
    }
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  static Future<bool> saveJson({
    required String key,
    required Map<String, dynamic> json,
  }) async {
    final jsonString = jsonEncode(json);
    return await sharedPreferences.setString(key, jsonString);
  }

  static Map<String, dynamic>? getJson({required String key}) {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
  // 1. إضافة وظائف لتخزين واسترجاع CarEntity في CacheHelper
  // static Future<bool> saveCarEntity(CarEntity carEntity) async {
  //   return await saveJson(
  //     key: 'cached_car',
  //     json: carEntity.toJson(),
  //   );
  // }

  // static CarEntity? getCarEntity() {
  //   final json = getJson(key: 'cached_car');
  //   if (json != null) {
  //     return CarEntity.fromJson(json);
  //   }
  //   return null;
  // }
}
