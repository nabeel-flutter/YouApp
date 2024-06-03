import 'package:flutter/material.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/constant/shared_preference_constants.dart';
import 'package:e_finder/src/di/injector.dart';
import 'package:e_finder/src/util/shared_preferences_util.dart';

class MyTheme with ChangeNotifier {
  static bool isDark = false;
  static Color color = ColorConstants.primaryColor;
  void getStorageTheme() async {
    isDark = (await getIt
        .get<SharedPreferencesUtil>()
        .getBool(SharedPreferenceConstants.isDark))!;
  }

  ThemeMode currentTheme() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchColor(Color color) {
    MyTheme.color = color;
    notifyListeners();
  }

  void switchTheme() {
    isDark = !isDark;
    getIt
        .get<SharedPreferencesUtil>()
        .setBool(SharedPreferenceConstants.isDark, value: isDark);
    notifyListeners();
  }

  Color getColor() {
    return MyTheme.color;
  }
}
