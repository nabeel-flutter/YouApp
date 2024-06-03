import 'package:easy_localization/easy_localization.dart';
import 'package:e_finder/main.dart';

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
