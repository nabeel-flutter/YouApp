import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:your_app_test/src/constant/http_constants.dart';
import 'package:your_app_test/src/core/log_filter.dart';
import 'package:your_app_test/src/data/common/object_mapper.dart';
import 'package:your_app_test/src/data/datasource/api/at_care_api.dart';
import 'package:your_app_test/src/data/datasource/interceptor/auth_interceptor.dart';
import 'package:your_app_test/src/data/repository/api_repository_impl.dart';
import 'package:your_app_test/src/domain/repository/api_repository.dart';
import 'package:your_app_test/src/listeners/login_state.dart';
import 'package:your_app_test/src/pages/forgot_password/cubit/forget_password_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/get_profile_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/update_profile_cubit.dart';

import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:your_app_test/src/pages/verify_email/cubit/verify_email_cubit.dart';
import 'package:your_app_test/src/route/app_router.dart';
import 'package:your_app_test/src/util/shared_preferences_util.dart';

final getIt = GetIt.instance;

///
/// This method must be called when the app starts. It initialize all
/// dependencies injected using [GetIt].
///
Future<void> initializeInjectedDependencies({
  bool enableLogger = false,
}) async {
  _injectUtilities(enableLogger: enableLogger);

  await _initializeData();
  _injectBlocsAndCubits();
}

void _injectUtilities({
  bool enableLogger = false,
}) {
  getIt
    ..registerLazySingleton(() => Logger(filter: AppLogFilter(enableLogger)))
    ..registerFactory<Key>(() => Key(const Uuid().v1()));
}

void _injectBlocsAndCubits() {
  getIt.registerFactory(() => SignInCubit(getIt.get()));
  getIt.registerFactory(() => SignUpCubit(getIt.get()));
  getIt.registerFactory(() => ForgetPasswordCubit(getIt.get()));
  getIt.registerFactory(() => VerifyEmailCubit(getIt.get()));
  getIt.registerFactory(() => GetProfileCubit(getIt.get()));
  getIt.registerFactory(() => UpdateProfileCubit(getIt.get()));
  getIt.registerLazySingleton(() => AppRouter());
}

Future<void> _initializeData({bool enableLogging = true}) async {
  getIt.get<Logger>().d('Initializing Data module...');
  getIt.registerSingleton(ObjectMapper(logger: getIt.get()));

  final sharedPref = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  getIt.registerFactory<SharedPreferencesUtil>(
    () => SharedPreferencesUtil(
      secureStorage: secureStorage,
      logger: getIt.get(),
    ),
  );

  final loginState = LoginState(sharedPref)..checkLoggedIn();
  getIt.registerFactory(() => loginState);
  // network configuration
  final dio = Dio(
    BaseOptions(
      baseUrl: HttpConstants.base,
      receiveTimeout: const Duration(seconds: 60000),
      // 1 minute
      connectTimeout: const Duration(seconds: 60000),
      // 1 minute
      sendTimeout: const Duration(seconds: 60000),
      // 1 minute
      contentType: 'application/json',
    ),
  );

  // inject dependencies
  getIt
    ..registerSingleton(YouAppApi(dio))
    ..registerFactory<ApiRepository>(
      () => ApiRepositoryImpl(
        youAppApi: getIt.get(),
        objectMapper: getIt.get(),
        logger: getIt.get(),
      ),
    );
  // add interceptor

  final interceptor = AuthInterceptor(
    getIt.get(),
    getIt.get(),
  );
  dio.interceptors.add(interceptor);

  if (enableLogging) {
    dio.interceptors.add(PrettyDioLogger());
  }
}
