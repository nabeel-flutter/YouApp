import 'package:flutter/material.dart';
import 'package:your_app_test/src/theme/palette.dart';
import 'package:your_app_test/src/util/navigation_util.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => NavigationUtil.pop(context),
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Container(),
      ],
    );
  }
}
