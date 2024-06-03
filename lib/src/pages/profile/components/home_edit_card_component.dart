import 'package:flutter/material.dart';
import 'package:e_finder/src/constant/assets_constants.dart';

class HomeEditCardComponent extends StatelessWidget {
  const HomeEditCardComponent({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title,
          style: TextStyle(
              height: 1.694,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white)),
      GestureDetector(
          onTap: () => onTap(),
          child: Image.asset(
            AssetsConstants.editIcon,
            height: 20,
          ))
    ]);
  }
}
