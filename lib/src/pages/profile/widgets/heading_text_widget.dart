import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  const HeadingText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
    );
  }
}
