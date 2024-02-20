import 'package:new_beginnings/src/app/app_export.dart';

void switchColorApp({required Color color}) =>
    Provider.of<MyTheme>(navigationService!.navigatorKey.currentContext!,
            listen: false)
        .switchColor(color);
