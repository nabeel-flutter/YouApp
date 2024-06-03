import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_finder/src/theme/get_theme_color.dart';
import 'package:e_finder/src/theme/lighten_darken_color.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({super.key, required this.imageUrl, this.color});

  final String imageUrl;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: color ?? lighten(getThemeColor(context), 0.25).withOpacity(0.7),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(imageUrl),
      ),
    );
  }
}
