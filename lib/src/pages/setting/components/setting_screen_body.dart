import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/constant/shared_preference_constants.dart';
import 'package:your_app_test/src/di/injector.dart';
import 'package:your_app_test/src/route/app_router.dart';
import 'package:your_app_test/src/util/shared_preferences_util.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          getIt
              .get<SharedPreferencesUtil>()
              .removeValue(SharedPreferenceConstants.apiAuthToken)
              .then((value) async => await context.router.pushAndPopUntil(
                  predicate: (route) => false, const SignInRoute()));
        },
        child: Text(
          'Logout',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: ColorConstants.subTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ),
    );
  }
}
