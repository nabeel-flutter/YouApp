import 'package:flutter/material.dart';
import 'package:your_app_test/src/theme/font_constants.dart';
import 'package:your_app_test/src/style/font_style.constant.dart';

class TextComponentSettingMainHeading extends StatelessWidget {
  const TextComponentSettingMainHeading({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: FontStylesConstants.gilroy(
            fontFamily: FontConstants.gilroyRegular, fontSize: 20));
  }
}
