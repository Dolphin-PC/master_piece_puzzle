import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommUtil {
  static void execAfterOnlyBinding(Function fn) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fn();
    });
  }

  static Future<List<dynamic>> getDataFromJson(
      [String fileName = "data"]) async {
    final String jsonString =
        await rootBundle.loadString('assets/$fileName.json');

    List<dynamic> orgJson = jsonDecode(jsonString);

    return orgJson;
  }
}
