import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_finder/main.dart';
import 'package:e_finder/src/theme/theme.dart';

void switchColorApp({required Color color}) =>
    Provider.of<MyTheme>(navigationService!.navigatorKey.currentContext!,
            listen: false)
        .switchColor(color);
