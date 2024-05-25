import 'package:easy_localization/easy_localization.dart';
import 'package:your_app_test/main.dart';

bool getCurrentLanguageDirection() {
  if (navigationService!.navigatorKey.currentContext!.locale.toString() ==
      'ur_PK') {
    return true;
  } else if (navigationService!.navigatorKey.currentContext!.locale
          .toString() ==
      'ar_AE') {
    return true;
  } else {
    return false;
  }
}
