// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ATRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ATScreen(),
      );
    },
    AllDoctorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllDoctorsScreen(),
      );
    },
    AllServicesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllServicesScreen(),
      );
    },
    BookAppointmentRoute.name: (routeData) {
      final args = routeData.argsAs<BookAppointmentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookAppointmentScreen(
          key: args.key,
          slot: args.slot,
          service: args.service,
          paymentMethod: args.paymentMethod,
          date: args.date,
          time: args.time,
        ),
      );
    },
    CPTRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CPTScreen(),
      );
    },
    DoctorProfileRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoctorProfileScreen(
          key: args.key,
          doctor: args.doctor,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordScreen(),
      );
    },
    GTRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GTScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    IDRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IDScreen(),
      );
    },
    MMRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MMScreen(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPasswordScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    OTPRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OTPScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PCRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PCScreen(),
      );
    },
    PMRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PMScreen(),
      );
    },
    PTRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PTScreen(),
      );
    },
    PaymentWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentWebViewScreen(
          key: args.key,
          uri: args.uri,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ServiceInnerRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceInnerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServiceInnerScreen(
          key: args.key,
          service: args.service,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TPRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TPScreen(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyEmailScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
  };
}

/// generated route for
/// [ATScreen]
class ATRoute extends PageRouteInfo<void> {
  const ATRoute({List<PageRouteInfo>? children})
      : super(
          ATRoute.name,
          initialChildren: children,
        );

  static const String name = 'ATRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AllDoctorsScreen]
class AllDoctorsRoute extends PageRouteInfo<void> {
  const AllDoctorsRoute({List<PageRouteInfo>? children})
      : super(
          AllDoctorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllDoctorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AllServicesScreen]
class AllServicesRoute extends PageRouteInfo<void> {
  const AllServicesRoute({List<PageRouteInfo>? children})
      : super(
          AllServicesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllServicesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookAppointmentScreen]
class BookAppointmentRoute extends PageRouteInfo<BookAppointmentRouteArgs> {
  BookAppointmentRoute({
    Key? key,
    Slot? slot,
    required Service service,
    required String paymentMethod,
    required String date,
    required String time,
    List<PageRouteInfo>? children,
  }) : super(
          BookAppointmentRoute.name,
          args: BookAppointmentRouteArgs(
            key: key,
            slot: slot,
            service: service,
            paymentMethod: paymentMethod,
            date: date,
            time: time,
          ),
          initialChildren: children,
        );

  static const String name = 'BookAppointmentRoute';

  static const PageInfo<BookAppointmentRouteArgs> page =
      PageInfo<BookAppointmentRouteArgs>(name);
}

class BookAppointmentRouteArgs {
  const BookAppointmentRouteArgs({
    this.key,
    this.slot,
    required this.service,
    required this.paymentMethod,
    required this.date,
    required this.time,
  });

  final Key? key;

  final Slot? slot;

  final Service service;

  final String paymentMethod;

  final String date;

  final String time;

  @override
  String toString() {
    return 'BookAppointmentRouteArgs{key: $key, slot: $slot, service: $service, paymentMethod: $paymentMethod, date: $date, time: $time}';
  }
}

/// generated route for
/// [CPTScreen]
class CPTRoute extends PageRouteInfo<void> {
  const CPTRoute({List<PageRouteInfo>? children})
      : super(
          CPTRoute.name,
          initialChildren: children,
        );

  static const String name = 'CPTRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DoctorProfileScreen]
class DoctorProfileRoute extends PageRouteInfo<DoctorProfileRouteArgs> {
  DoctorProfileRoute({
    Key? key,
    required Doctor doctor,
    List<PageRouteInfo>? children,
  }) : super(
          DoctorProfileRoute.name,
          args: DoctorProfileRouteArgs(
            key: key,
            doctor: doctor,
          ),
          initialChildren: children,
        );

  static const String name = 'DoctorProfileRoute';

  static const PageInfo<DoctorProfileRouteArgs> page =
      PageInfo<DoctorProfileRouteArgs>(name);
}

class DoctorProfileRouteArgs {
  const DoctorProfileRouteArgs({
    this.key,
    required this.doctor,
  });

  final Key? key;

  final Doctor doctor;

  @override
  String toString() {
    return 'DoctorProfileRouteArgs{key: $key, doctor: $doctor}';
  }
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GTScreen]
class GTRoute extends PageRouteInfo<void> {
  const GTRoute({List<PageRouteInfo>? children})
      : super(
          GTRoute.name,
          initialChildren: children,
        );

  static const String name = 'GTRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IDScreen]
class IDRoute extends PageRouteInfo<void> {
  const IDRoute({List<PageRouteInfo>? children})
      : super(
          IDRoute.name,
          initialChildren: children,
        );

  static const String name = 'IDRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MMScreen]
class MMRoute extends PageRouteInfo<void> {
  const MMRoute({List<PageRouteInfo>? children})
      : super(
          MMRoute.name,
          initialChildren: children,
        );

  static const String name = 'MMRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPasswordScreen]
class NewPasswordRoute extends PageRouteInfo<void> {
  const NewPasswordRoute({List<PageRouteInfo>? children})
      : super(
          NewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OTPScreen]
class OTPRoute extends PageRouteInfo<void> {
  const OTPRoute({List<PageRouteInfo>? children})
      : super(
          OTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PCScreen]
class PCRoute extends PageRouteInfo<void> {
  const PCRoute({List<PageRouteInfo>? children})
      : super(
          PCRoute.name,
          initialChildren: children,
        );

  static const String name = 'PCRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PMScreen]
class PMRoute extends PageRouteInfo<void> {
  const PMRoute({List<PageRouteInfo>? children})
      : super(
          PMRoute.name,
          initialChildren: chpayment ildren,
        );

  static const String name = 'PMRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PTScreen]
class PTRoute extends PageRouteInfo<void> {
  const PTRoute({List<PageRouteInfo>? children})
      : super(
          PTRoute.name,
          initialChildren: children,
        );

  static const String name = 'PTRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentWebViewScreen]
class PaymentWebViewRoute extends PageRouteInfo<PaymentWebViewRouteArgs> {
  PaymentWebViewRoute({
    Key? key,
    required String uri,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentWebViewRoute.name,
          args: PaymentWebViewRouteArgs(
            key: key,
            uri: uri,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentWebViewRoute';

  static const PageInfo<PaymentWebViewRouteArgs> page =
      PageInfo<PaymentWebViewRouteArgs>(name);
}

class PaymentWebViewRouteArgs {
  const PaymentWebViewRouteArgs({
    this.key,
    required this.uri,
  });

  final Key? key;

  final String uri;

  @override
  String toString() {
    return 'PaymentWebViewRouteArgs{key: $key, uri: $uri}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceInnerScreen]
class ServiceInnerRoute extends PageRouteInfo<ServiceInnerRouteArgs> {
  ServiceInnerRoute({
    Key? key,
    required ServiceModel service,
    List<PageRouteInfo>? children,
  }) : super(
          ServiceInnerRoute.name,
          args: ServiceInnerRouteArgs(
            key: key,
            service: service,
          ),
          initialChildren: children,
        );

  static const String name = 'ServiceInnerRoute';

  static const PageInfo<ServiceInnerRouteArgs> page =
      PageInfo<ServiceInnerRouteArgs>(name);
}

class ServiceInnerRouteArgs {
  const ServiceInnerRouteArgs({
    this.key,
    required this.service,
  });

  final Key? key;

  final ServiceModel service;

  @override
  String toString() {
    return 'ServiceInnerRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TPScreen]
class TPRoute extends PageRouteInfo<void> {
  const TPRoute({List<PageRouteInfo>? children})
      : super(
          TPRoute.name,
          initialChildren: children,
        );

  static const String name = 'TPRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyEmailScreen]
class VerifyEmailRoute extends PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args: VerifyEmailRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<VerifyEmailRouteArgs> page =
      PageInfo<VerifyEmailRouteArgs>(name);
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, email: $email}';
  }
}
