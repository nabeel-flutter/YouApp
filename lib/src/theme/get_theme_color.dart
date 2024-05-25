import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_app_test/src/theme/theme.dart';

Color getThemeColor(BuildContext context) =>
    Provider.of<MyTheme>(context, listen: false).getColor();
