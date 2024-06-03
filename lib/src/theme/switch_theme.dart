import 'package:provider/provider.dart';
import 'package:e_finder/main.dart';
import 'package:e_finder/src/theme/theme.dart';

void switchThemeApp() =>
    Provider.of<MyTheme>(navigationService!.navigatorKey.currentContext!,
            listen: false)
        .switchTheme();
