
import 'package:dio/dio.dart';

import 'package:your_app_test/src/data/dto/base_response_dto.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/data/dto/token_dto.dart';

///
///
class YouAppApi {
  static String kRouteAuthLogin = 'login';

  static String kRouteAuthSignUp = 'register';

  static String kRouteAuthForgetPassword = 'password/forgot';

  static String kRouteAuthVerifyEmail = 'resendEmailVerify';
  static String kRouteGetProfile = 'getProfile';

  final Dio dio;

  const YouAppApi(this.dio);

  Future<BaseResponseDto<TokenDto>> signIn(
      {required String email, required String password}) async {
    final response = await dio.post(kRouteAuthLogin,
        data: {'email': email, 'password': password, 'username': 'string'});
    return BaseResponseDto.fromJson({"data": response.data},
        (value) => TokenDto.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto<TokenDto>> signUp({
    required String password,
    required String userName,
    required String email,
    required String confirmPassword,
  }) async {
    final response = await dio.post(kRouteAuthSignUp,
        data: {'username': userName, 'password': password, 'email': email});
    return BaseResponseDto.fromJson({"data": response.data},
        (value) => TokenDto.fromJson(value as Map<String, dynamic>));
  }

  Future<BaseResponseDto> forgetPassword({
    required String email,
  }) async {
    final response =
        await dio.post(kRouteAuthForgetPassword, data: {'email': email});
    return BaseResponseDto.fromJson({"data": response.data}, (value) => value);
  }

  Future<BaseResponseDto> verifyEmail({required String email}) async {
    final response =
        await dio.post(kRouteAuthVerifyEmail, data: {'email': email});
    return BaseResponseDto.fromJson({"data": response.data}, (value) => value);
  }

  Future<BaseResponseDto<GetProfileDto>> getProfile() async {
    final response = await dio.get(kRouteGetProfile);
    return BaseResponseDto.fromJson(response.data as Map<String,dynamic>, (value) =>
    GetProfileDto.fromJson(value as Map<String, dynamic>)
     );
  }
}
