import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_app_test/src/theme/palette.dart';
import 'package:your_app_test/src/theme/font_constants.dart';

class FontStylesConstants {
  ///Noto Naskh Arabic
  static TextStyle notoNaskhArabic(
          {required double fontSize,
          Color color = Palette.black,
          FontWeight fontWeight = FontWeight.normal,
          TextDecoration decoration = TextDecoration.none,
          double letterSpacing = 0,
          double height = 0,
          bool isBaseLine = false}) =>
      GoogleFonts.notoNaskhArabic(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: height,
        letterSpacing: letterSpacing,
      );
  static TextStyle gilroy(
          {required double fontSize,
          String? fontFamily,
          Color? color,
          FontWeight fontWeight = FontWeight.normal,
          TextDecoration decoration = TextDecoration.none,
          double letterSpacing = 0,
          double height = 0,
          bool isBaseLine = false}) =>
      TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily ?? FontConstants.gilroyRegular,
        fontSize: fontSize,
        height: height,
        letterSpacing: letterSpacing,
      );
}
