import 'package:new_beginnings/src/app/app_export.dart';

Color getThemeColor(BuildContext context) =>
    Provider.of<MyTheme>(context, listen: false).getColor();
