import 'package:flutter/material.dart';

class AppUtils {
  static Color colorParser(String color) {
    try {
      return Color(int.parse(color.replaceAll('#', '0xff')));
    } catch (e) {
      return const Color(0xFF2A87FE);
    }
  }
}
