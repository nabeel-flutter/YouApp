import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/style/font_style.constant.dart';
import 'package:e_finder/src/theme/lighten_darken_color.dart';
import 'package:e_finder/src/theme/theme.dart';

ThemeData darkThemeData(MyTheme theme) {
  return ThemeData(
    drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.transparent, elevation: 0),
    useMaterial3: true,
    colorSchemeSeed: theme.getColor(),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith((states) {
          return FontStylesConstants.gilroy(
              fontSize: 16, color: darken(theme.getColor(), 0.35));
        }),
        shape: WidgetStateProperty.resolveWith((states) {
          return DecoratedOutlinedBorder(
            shadow: [
              GradientShadow(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 111, 0, 255).withOpacity(0.5),
                        const Color(0xFF9747FF).withOpacity(0.5),
                      ]),
                  blurRadius: 100,
                  offset: const Offset(0, 14))
            ],
            backgroundGradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color.fromARGB(255, 111, 0, 255), Color(0xFF9747FF)]),
            child: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
          );
        }),
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
        maximumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
        backgroundColor: const WidgetStatePropertyAll(
          Colors.transparent,
        ),
        foregroundColor: const WidgetStatePropertyAll(
          ColorConstants.white,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: theme.getColor(),
      textTheme: ButtonTextTheme.accent,
      height: 70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
    ),
    textTheme: TextTheme(
      titleSmall: FontStylesConstants.gilroy(
          fontSize: 8, color: darken(theme.getColor(), 0.35)),
      titleMedium: FontStylesConstants.gilroy(
          fontSize: 10, color: darken(theme.getColor(), 0.35)),
      bodySmall: FontStylesConstants.gilroy(
          fontSize: 14, color: darken(theme.getColor(), 0.35)),
      bodyMedium: FontStylesConstants.gilroy(
          fontSize: 16, color: darken(theme.getColor(), 0.35)),
      bodyLarge: FontStylesConstants.gilroy(
          fontSize: 18, color: darken(theme.getColor(), 0.35)),
      labelSmall: FontStylesConstants.gilroy(
          fontSize: 12, color: darken(theme.getColor(), 0.35)),
      titleLarge: FontStylesConstants.gilroy(
          fontSize: 20, color: darken(theme.getColor(), 0.35)),
      labelMedium: FontStylesConstants.gilroy(
          fontSize: 22, color: darken(theme.getColor(), 0.35)),
      labelLarge: FontStylesConstants.gilroy(
          fontSize: 24, color: darken(theme.getColor(), 0.35)),
      headlineSmall: FontStylesConstants.gilroy(
          fontSize: 26, color: darken(theme.getColor(), 0.35)),
      headlineMedium: FontStylesConstants.gilroy(
          fontSize: 28, color: darken(theme.getColor(), 0.35)),
      headlineLarge: FontStylesConstants.gilroy(
          fontSize: 30, color: darken(theme.getColor(), 0.35)),
      displaySmall: FontStylesConstants.gilroy(
          fontSize: 32, color: darken(theme.getColor(), 0.35)),
      displayMedium: FontStylesConstants.gilroy(
          fontSize: 34, color: darken(theme.getColor(), 0.35)),
      displayLarge: FontStylesConstants.gilroy(
          fontSize: 36, color: darken(theme.getColor(), 0.35)),
    ),
  );
}
