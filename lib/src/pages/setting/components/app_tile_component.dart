import 'package:flutter/material.dart';
import 'package:your_app_test/src/theme/get_theme_color.dart';
import 'package:your_app_test/src/theme/lighten_darken_color.dart';

class AppTileComponent extends StatelessWidget {
  final String test;
  final String image;
  final VoidCallback onTap;
  final bool isExpandable;

  const AppTileComponent({
    super.key,
    required this.test,
    required this.image,
    required this.onTap,
    required this.isExpandable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: !isExpandable
            ? const EdgeInsets.symmetric(vertical: 10)
            : EdgeInsets.zero,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        // height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: darken(lighten(getThemeColor(context), 0.2), 0.1),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(test),
          ],
        ),
      ),
    );
  }
}
