import 'package:flutter/material.dart';
import 'package:e_finder/src/constant/font_constants.dart';
import 'package:e_finder/src/style/font_style.constant.dart';

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
