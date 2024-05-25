import 'package:flutter/material.dart';
import 'package:your_app_test/src/theme/palette.dart';
import 'package:your_app_test/src/constant/shared_preference_constants.dart';
import 'package:your_app_test/src/di/injector.dart';
import 'package:your_app_test/src/util/shared_preferences_util.dart';

class MyTheme with ChangeNotifier {
  static bool isDark = false;
  static Color color = Palette.primaryColor;
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
