import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/components/main_scaffold.dart';
import 'package:your_app_test/src/constant/shared_preference_constants.dart';
import 'package:your_app_test/src/di/injector.dart';
import 'package:your_app_test/src/components/app_button.dart';
import 'package:your_app_test/src/route/app_router.dart';
import 'package:your_app_test/src/util/shared_preferences_util.dart';

class RetryState extends StatelessWidget {
  final VoidCallback onTap;

  const RetryState({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      isGradient: true,
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_rounded,
              color: Colors.white,
              size: 70,
            ),
            const SizedBox(height: 15),
            const Text(
              'Something went wrong try please \ntry again',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
              // style: FontStylesConstants.headingThree(color: Colors.black54),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: AppButton(
                enabled: true,
                title: 'Retry',
                onPressed: onTap,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: AppButton(
                isErrorButton: true,
                enabled: true,
                title: 'Logout',
                onPressed: () => getIt
                      .get<SharedPreferencesUtil>()
                      .removeValue(SharedPreferenceConstants.apiAuthToken)
                      .then((value) async => await context.router
                          .pushAndPopUntil(
                              predicate: (route) => false,
                              const SignInRoute())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
