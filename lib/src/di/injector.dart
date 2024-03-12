import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/cubit/cubit/service_cubit.dart';
import 'package:new_beginnings/src/pages/doctors/cubit/cubit/doctors_cubit.dart';
import 'package:new_beginnings/src/pages/forgot_password/cubit/forget_password_cubit.dart';
import 'package:new_beginnings/src/pages/mental_health/mental_health_inner_pages/gad_7/cubit/gad_7_cubit.dart';
import 'package:new_beginnings/src/pages/product_detail/cubit/product_detail_cubit.dart';
import 'package:new_beginnings/src/pages/products/cubit/products_list_cubit.dart';
import 'package:new_beginnings/src/pages/profile/cubit/user_profile_cubit.dart';
import 'package:new_beginnings/src/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:new_beginnings/src/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:new_beginnings/src/pages/verify_email/cubit/verify_email_cubit.dart';

import 'package:new_beginnings/src/route/app_router.dart';

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
  await _initRepos();
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
  getIt.registerFactory(() => AnimatedDrawerCubit());
  getIt.registerFactory(() => IsGradientBackgroundCubit());
  getIt.registerFactory(() => PHQ9Cubit());
  getIt.registerFactory(() => ProductsListCubit(getIt.get()));
  getIt.registerFactory(() => ProductDetailCubit(getIt.get()));
  getIt.registerFactory(() => SignInCubit(getIt.get()));
  getIt.registerFactory(() => SignUpCubit(getIt.get()));
  getIt.registerFactory(() => ForgetPasswordCubit(getIt.get()));
  getIt.registerFactory(() => VerifyEmailCubit(getIt.get()));
  getIt.registerFactory(() => UserProfileCubit(getIt.get()));
  
  
  getIt.registerFactory(() => GAD7Cubit());
  getIt.registerFactory(() => DoctorsCubit());
    getIt.registerFactory(() => ServiceCubit());
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
    ..registerSingleton(DioClientNetwork(dio))
    ..registerSingleton(SoftTechTestApi(dio))
    ..registerFactory<ApiRepository>(
      () => ApiRepositoryImpl(
        softTechTestApi: getIt.get(),
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

Future<void> _initRepos() async {
  getIt
    ..registerSingleton(
      DioApiServices(
        onAPIErrorDetection: () async {
          BlocProvider.of<AppCubit>(navigationService!.getKey().currentContext!)
              .user = null;
          // await getIt<BottomNavCubit>().logout().then((value) => null);
          await getIt<SharedPreferencesUtil>().removeValue(
            SharedPreferenceConstants.user,
          );
          await getIt<SharedPreferencesUtil>().removeValue(
            SharedPreferenceConstants.userId,
          );
          await getIt<SharedPreferencesUtil>().removeValue(
            SharedPreferenceConstants.apiAuthToken,
          );
          await getIt<DioClientNetwork>().initializeDioClientNetwork(
            deleteToken: true,
            locale: 1,
          );
        },
      ),
    )
    ..registerFactory(
      () => AppCubit(),
    );
}
