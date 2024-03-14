import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/appointment/cubit/appointnent_details/appointment_cubit_cubit.dart';
import 'package:new_beginnings/src/pages/forgot_password/cubit/forget_password_cubit.dart';
import 'package:new_beginnings/src/pages/profile/cubit/user_profile_cubit.dart';
import 'package:new_beginnings/src/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:new_beginnings/src/pages/sign_up/cubit/sign_up_cubit.dart';

import 'package:new_beginnings/src/pages/doctors/cubit/cubit/doctors_cubit.dart';

import 'package:new_beginnings/src/pages/all_services/cubit/cubit/service_cubit.dart';
import 'package:new_beginnings/src/pages/verify_email/cubit/verify_email_cubit.dart';

import '../pages/appointment/cubit/book_appointment/cubit/book_appointment_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: Consumer<MyTheme>(
        child: Container(),
        builder: (context, theme, _) {
          final appRouter = getIt<AppRouter>();
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInCubit(getIt.get()),
              ),
              BlocProvider(create: (context) => UserProfileCubit(getIt.get()),),
              BlocProvider(create:(context) =>  VerifyEmailCubit(getIt.get())),
              BlocProvider(
                create: (context) => SignUpCubit(getIt.get()),
              ),
              BlocProvider(
                create: (context) => ForgetPasswordCubit(getIt.get()),
              ),
              BlocProvider(create: (context) => AppCubit()),
              BlocProvider(create: (context) => AnimatedDrawerCubit()),
              BlocProvider(create: (context) => IsGradientBackgroundCubit()),
              BlocProvider(create: (context) => AppointmentCubit(getIt.get())),
              BlocProvider(create: (context) => BookAppointmentCubit(getIt.get())),
              BlocProvider(create: (context) => DoctorsCubit()),
              BlocProvider(
                create: (context) => ServiceCubit(),
              ),

            ],
            child: MaterialApp.router(
              key: navigationService?.navigatorKey,
              // navigatorKey: navigationService?.navigatorKey,
              // onGenerateRoute: onGenerateRoute,
              routerConfig: appRouter.config(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowMaterialGrid: false,
              debugShowCheckedModeBanner: false,
              themeMode: theme.currentTheme(),
              darkTheme: darkThemeData(theme),
              title: F.title,
              theme: lightThemeData(theme),
            ),
          );
        },
      ),
    );
  }
}
