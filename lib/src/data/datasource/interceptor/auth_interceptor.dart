import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:e_finder/src/constant/app_constants.dart';
import 'package:e_finder/src/constant/shared_preference_constants.dart';
import 'package:e_finder/src/di/injector.dart';
import 'package:e_finder/src/util/shared_preferences_util.dart';

class AuthInterceptor extends InterceptorsWrapper {
  static const requiresAuth = 'requiresAuthentication';

  final Logger logger;
  final SharedPreferencesUtil _sharedPreferencesUtil;
  AuthInterceptor(
    this.logger,
    this._sharedPreferencesUtil,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final hasSessionExpired = await _preferences.hasTokenExpired() == true;
    final bool requestRequiresAuth;
    if (options.extra.containsKey(requiresAuth)) {
      requestRequiresAuth = options.extra[requiresAuth] as bool;
    } else {
      requestRequiresAuth = true;
    }

    if (requestRequiresAuth) {
      final userId = await _sharedPreferencesUtil.getUserId();
      final authToken = await getIt<SharedPreferencesUtil>().getString(
        SharedPreferenceConstants.apiAuthToken,
      );

      options.headers['x-access-token'] = authToken;
      options.headers['device'] = Platform.isIOS
          ? AppConstants.iosPlatform
          : AppConstants.androidPlatform;

      options.headers['platform'] = 'app';
      options.headers['user-id'] = userId.isNotEmpty ? userId : '0';

      logger.d("header : ${options.headers}");
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 /* unauthorized */) {
      // await _preferences.clearSession();
    }

    super.onError(err, handler);
  }
}
