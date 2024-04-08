import 'package:new_beginnings/src/app/app_export.dart';

class AuthInterceptor extends InterceptorsWrapper {
  static const requiresAuth = 'requiresAuthentication';

  final Logger logger;
  BuildContext? _context;
  AuthInterceptor(
    this.logger,
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
      // final userId = await _sharedPreferencesUtil.getUserId();
      final authToken = await getIt<SharedPreferencesUtil>().getString(
        SharedPreferenceConstants.apiAuthToken,
      );

      options.headers['Authorization'] = authToken;
      options.headers['token'] = authToken;

      // options.headers['locale'] = BlocProvider.of<AppCubit>(
      //                 navigationService!.navigatorKey.currentContext!)
      //             .isUrdu(navigationService!.navigatorKey.currentContext!.locale
      //                 .toString()) ==
      //         true
      //     ? 2
      //     : 1;
      // // options.headers['locale'] =2;
      // options.headers['device'] = Platform.isIOS
      //     ? AppConstants.iosPlatform
      //     : AppConstants.androidPlatform;

      // options.headers['platform'] = 'app';
      // options.headers['user-id'] = userId.isNotEmpty ? userId : '0';

      logger.d("header : ${options.headers}");
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_context != null) {
      if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
        getIt
            .get<SharedPreferencesUtil>()
            .removeValue(SharedPreferenceConstants.apiAuthToken);
        NavigationUtil.popAllAndPush(
          _context!,
          RouteConstants.signInRoute,
        );
      }

      super.onError(err, handler);
    }
  }
}
