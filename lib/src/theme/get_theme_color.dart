import 'package:your_app_test/src/app/app_export.dart';

Color getThemeColor(BuildContext context) =>
    Provider.of<MyTheme>(context, listen: false).getColor();
