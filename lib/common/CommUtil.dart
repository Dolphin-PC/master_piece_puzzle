import 'package:flutter/material.dart';

class CommUtil {
  static void execAfterOnlyBinding(Function fn) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fn();
    });
  }
}
