import 'package:flutter/material.dart';

Shader linearGradientText({required List<Color> colors}) {
  return LinearGradient(
    colors: colors, // Gradient colors
    begin: Alignment.bottomLeft, // Gradient start position
    end: Alignment.bottomRight, // Gradient end position
  ).createShader(
      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)); // Text bounding box
}
