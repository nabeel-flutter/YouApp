import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:e_finder/src/app/app.dart';
import 'package:e_finder/src/di/injector.dart';
import 'package:e_finder/src/theme/get_theme_color.dart';
import 'package:e_finder/src/theme/theme.dart';
import 'package:e_finder/src/util/services/navigation_service.dart';

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
