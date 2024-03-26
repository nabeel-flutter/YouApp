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
          page: VerifyEmailRoute.page,
          path: RouteConstants.verifyEmailRoute,
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
        AutoRoute(
          page: OTPRoute.page,
          path: RouteConstants.otpRoute,
        ),
        AutoRoute(
          page: AllDoctorsRoute.page,
          path: RouteConstants.allDoctorsRoute,
        ),
        AutoRoute(
          page: AllServicesRoute.page,
          path: RouteConstants.allServicesRoute,
        ),
        AutoRoute(
          page: ServiceInnerRoute.page,
        ),
        AutoRoute(
          page: GTRoute.page,
        ),
        AutoRoute(
          page: ATRoute.page,
        ),
        AutoRoute(
          page: CPTRoute.page,
        ),
        AutoRoute(
          page: MMRoute.page,
        ),
        AutoRoute(page: IDRoute.page),
        AutoRoute(page: PTRoute.page),
        AutoRoute(page: PMRoute.page),
        AutoRoute(page: PCRoute.page),
        AutoRoute(page: TPRoute.page),
        AutoRoute(
          page: BookAppointmentRoute.page,
          path: RouteConstants.bookAppointmentRoute,
        ),
        AutoRoute(
          page: EditProfileRoute.page,
          path: RouteConstants.editProfile,
        ),
        AutoRoute(
          page: DoctorProfileRoute.page,
          path: RouteConstants.doctorProfileRoute,
        ),
        AutoRoute(
          page: PaymentWebViewRoute.page,
        ),
        AutoRoute(
          page: PrivacyPolicyRoute.page,
        ),
        AutoRoute(
          page: TermsConditionsRoute.page,
        ),
      ];
}
