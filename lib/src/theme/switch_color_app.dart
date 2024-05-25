import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_app_test/main.dart';
import 'package:your_app_test/src/theme/theme.dart';

void switchColorApp({required Color color}) =>
    Provider.of<MyTheme>(navigationService!.navigatorKey.currentContext!,
            listen: false)
        .switchColor(color);
