import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/constant/route_constants.dart';
import 'package:your_app_test/src/pages/forgot_password/forgot_password_screen.dart';
import 'package:your_app_test/src/pages/profile/my_profile_page.dart';
import 'package:your_app_test/src/pages/sign_in/sign_in_screen.dart';
import 'package:your_app_test/src/pages/sign_up/sign_up_screen.dart';
import 'package:your_app_test/src/pages/verify_email/verify_email_screen.dart';
import 'package:your_app_test/src/pages/otp/otp_screen.dart';
import 'package:your_app_test/src/pages/new_password/new_password_screen.dart';
import 'package:your_app_test/src/pages/splash/splash_screen.dart';
import 'package:your_app_test/src/pages/terms_conditions/terms_conditions_screen.dart';
import 'package:your_app_test/src/pages/setting/setting_screen.dart';
import 'package:your_app_test/src/pages/profile/inner%20_screens/interest/interest_sccreen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true, path: '/'),
        AutoRoute(page: InterestRoute.page, path: RouteConstants.interestRoute),
        AutoRoute(page: SignInRoute.page, path: RouteConstants.signInRoute),
        AutoRoute(page: SettingsRoute.page, path: RouteConstants.settingRoute),
        AutoRoute(page: HomeRoute.page, path: RouteConstants.homeRoute),
        AutoRoute(page: SignUpRoute.page, path: RouteConstants.signUpRoute),
        AutoRoute(
            page: ForgotPasswordRoute.page,
            path: RouteConstants.forgotPasswordRoute),
        AutoRoute(
            page: VerifyEmailRoute.page, path: RouteConstants.verifyEmailRoute),
        AutoRoute(
            page: NewPasswordRoute.page, path: RouteConstants.newPasswordRoute),
        AutoRoute(page: OTPRoute.page, path: RouteConstants.otpRoute),
        AutoRoute(
            page: TermsConditionsRoute.page,
            path: RouteConstants.termsConditionsRoute)
      ];
}
