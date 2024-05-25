import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/theme/palette.dart';
import 'package:your_app_test/src/style/font_style.constant.dart';
import 'package:your_app_test/src/theme/lighten_darken_color.dart';
import 'package:your_app_test/src/theme/theme.dart';

ThemeData lightThemeData(MyTheme theme, {Color? color}) {
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: color ?? theme.getColor(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: darken(theme.getColor(), 0.35),
    appBarTheme: AppBarTheme(
        backgroundColor: darken(theme.getColor(), 0.35),
        foregroundColor: Palette.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith((states) {
          return DecoratedOutlinedBorder(
            backgroundGradient: LinearGradient(colors: [
              Colors.blue.withOpacity(0.5),
              Colors.blue.withOpacity(0.2)
            ]),
            child:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          );
        }),
        fixedSize: const MaterialStatePropertyAll(Size.fromHeight(60)),
        maximumSize: const MaterialStatePropertyAll(Size.fromHeight(60)),
        minimumSize: const MaterialStatePropertyAll(Size.fromHeight(60)),
        backgroundColor: MaterialStatePropertyAll(
          theme.getColor(),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          Palette.white,
        ),
      ),
    ),
    drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.transparent, elevation: 0),
    buttonTheme: ButtonThemeData(
      buttonColor: theme.getColor(),
      textTheme: ButtonTextTheme.accent,
      height: 70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    ),
    textTheme: TextTheme(
      titleSmall: FontStylesConstants.gilroy(fontSize: 8, color: Palette.white),
      titleMedium:
          FontStylesConstants.gilroy(fontSize: 10, color: Palette.white),
      bodySmall: FontStylesConstants.gilroy(fontSize: 14, color: Palette.white),
      bodyMedium:
          FontStylesConstants.gilroy(fontSize: 16, color: Palette.white),
      bodyLarge: FontStylesConstants.gilroy(fontSize: 18, color: Palette.white),
      labelSmall:
          FontStylesConstants.gilroy(fontSize: 12, color: Palette.white),
      titleLarge:
          FontStylesConstants.gilroy(fontSize: 20, color: Palette.white),
      labelMedium:
          FontStylesConstants.gilroy(fontSize: 22, color: Palette.white),
      labelLarge:
          FontStylesConstants.gilroy(fontSize: 24, color: Palette.white),
      headlineSmall:
          FontStylesConstants.gilroy(fontSize: 26, color: Palette.white),
      headlineMedium:
          FontStylesConstants.gilroy(fontSize: 28, color: Palette.white),
      headlineLarge:
          FontStylesConstants.gilroy(fontSize: 30, color: Palette.white),
      displaySmall:
          FontStylesConstants.gilroy(fontSize: 32, color: Palette.white),
      displayMedium:
          FontStylesConstants.gilroy(fontSize: 34, color: Palette.white),
      displayLarge:
          FontStylesConstants.gilroy(fontSize: 36, color: Palette.white),
    ),
  );
}
