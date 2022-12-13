import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommUtil {
  static void execAfterOnlyBinding(Function fn) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fn();
    });
  }

  static Future<List<dynamic>> getDataFromJson([String fileName = "data"]) async {
    final String jsonString = await rootBundle.loadString('assets/$fileName.json');

    List<dynamic> orgJson = jsonDecode(jsonString);

    return orgJson;
  }

  static Future<bool> isSharedData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static Future<T?> getSharedData<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) return null;

    switch (T) {
      case bool:
        return prefs.getBool(key) as T;
      case String:
        return prefs.getString(key) as T;
      case int:
        return prefs.getInt(key) as T;
      case double:
        return prefs.getDouble(key) as T;
      case List<String>:
        return prefs.getStringList(key) as T;
      case Object:
        return prefs.get(key) as T;
    }
    return null;
  }

  static void setSharedData<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();

    switch (T) {
      case bool:
        prefs.setBool(key, value as bool);
        break;
      case String:
        prefs.setString(key, value as String);
        break;
      case int:
        prefs.setInt(key, value as int);
        break;
      case double:
        prefs.setDouble(key, value as double);
        break;
      case List<String>:
        prefs.setStringList(key, value as List<String>);
        break;
    }
  }

  static void addSharedData(String key, String value) async {
    List<String> resultList = await getSharedData<List<String>>(key) ?? [];
    resultList.add(value);
    setSharedData(key, resultList);
  }
}
