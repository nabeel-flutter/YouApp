import 'package:flutter/material.dart';
import 'package:your_app_test/main.dart';
import 'package:your_app_test/src/theme/get_theme_color.dart';
import 'package:your_app_test/src/theme/get_theme_state.dart';
import 'package:your_app_test/src/theme/lighten_darken_color.dart';

LinearGradient linerGradientForApp({
  bool isVertical = false,
  Color? color,
}) {
  return LinearGradient(
    begin: isVertical ? Alignment.centerLeft : Alignment.bottomCenter,
    tileMode: TileMode.mirror,
    end: isVertical ? Alignment.centerRight : Alignment.topCenter,
    colors: [
      !getThemeStateIsLight()
          ? Theme.of(navigationService!.navigatorKey.currentContext!)
              .scaffoldBackgroundColor
          : darken(
              color ??
                  getThemeColor(
                      navigationService!.navigatorKey.currentContext!),
              0.3),
      !getThemeStateIsLight()
          ? Theme.of(navigationService!.navigatorKey.currentContext!)
              .scaffoldBackgroundColor
          : color ??
              getThemeColor(navigationService!.navigatorKey.currentContext!),
    ],
  );
}
