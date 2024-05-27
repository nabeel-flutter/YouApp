import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_app_test/main.dart';
import 'package:your_app_test/src/app/restart_widget.dart';
import 'package:your_app_test/src/di/injector.dart';
import 'package:your_app_test/src/flavors/flavors.dart';
import 'package:your_app_test/src/pages/forgot_password/cubit/forget_password_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/about_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/get_profile_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/update_profile_cubit.dart';
import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_button_validation_cubit.dart';

import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_button_validation_cubit.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_cubit.dart';


import 'package:your_app_test/src/pages/verify_email/cubit/verify_email_cubit.dart';
import 'package:your_app_test/src/route/app_router.dart';
import 'package:your_app_test/src/theme/dark_theme_data.dart';
import 'package:your_app_test/src/theme/light_theme_data.dart';
import 'package:your_app_test/src/theme/theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: Consumer<MyTheme>(
        child: Container(),
        builder: (context, theme, _) {
          final appRouter = getIt<AppRouter>();
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context)=> AboutCubit()),
              BlocProvider(create: (context)=> UpdateProfileCubit(getIt.get())),
              BlocProvider(create: ((context) => GetProfileCubit(getIt.get()))),
              BlocProvider(create:(context) => SignUpButtonValidationCubit(),),
              BlocProvider(create:(context) => SignInButtonValidationCubit(),),
              BlocProvider(
                create: (context) => SignInCubit(getIt.get()),
              ),
              BlocProvider(create: (context) => VerifyEmailCubit(getIt.get())),
              BlocProvider(
                create: (context) => SignUpCubit(getIt.get()),
              ),
              BlocProvider(
                create: (context) => ForgetPasswordCubit(getIt.get()),
              ),
            ],
            child: MaterialApp.router(
              key: navigationService?.navigatorKey,
              // navigatorKey: navigationService?.navigatorKey,
              // onGenerateRoute: onGenerateRoute,
              routerConfig: appRouter.config(

              ),
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
