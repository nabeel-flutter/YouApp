import 'package:new_beginnings/src/app/app_export.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: SignInRoute.page,
          path: RouteConstants.signInRoute,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: RouteConstants.homeRoute,
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: RouteConstants.signUpRoute,
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
          path: RouteConstants.forgotPasswordRoute,
        ),
        AutoRoute(
          page: NewPasswordRoute.page,
          path: RouteConstants.newPasswordRoute,
        ),
        AutoRoute(
          page: NotificationRoute.page,
          path: RouteConstants.notificationRoute,
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: RouteConstants.profileRoute,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: RouteConstants.onboardingRoute,
        ),
      ];
}
