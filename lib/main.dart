import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:your_app_test/src/app/app_export.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeInjectedDependencies();
  navigationService = NavigationService();
  await EasyLocalization.ensureInitialized();

  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
        color: getThemeColor(navigationService!.navigatorKey.currentContext!),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              details.toString(),
            ),
          ),
        ),
      );
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ur', 'PK'),
        Locale('ar', 'AE'),
        Locale('es', 'ES'),
        Locale('hi', 'IN'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: ChangeNotifierProvider<MyTheme>(
        create: (_) => MyTheme()
          ..currentTheme()
          ..getColor()
          ..getStorageTheme()
          ..switchTheme(),
        child: const App(),
      ),
    ),
  );
}

NavigationService? navigationService;
