import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:new_beginnings/src/route/app_router.dart';

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
              BlocProvider(create: (context) => AppCubit()),
              BlocProvider(create: (context) => AnimatedDrawerCubit()),
              BlocProvider(create: (context) => IsGradientBackgroundCubit()),
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
