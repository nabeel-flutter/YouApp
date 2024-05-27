import 'package:your_app_test/src/data/dto/base_response_dto.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/data/dto/token_dto.dart';
import 'package:your_app_test/src/domain/domain.dart';

abstract class ApiRepository extends Repository {
  ///
  /// get user dashboard overview
  ///

  Future<Result<BaseResponseDto<TokenDto>>> signIn(
      {required String email, required String password});

  Future<Result<BaseResponseDto<TokenDto>>> signUp(
      {required String userName,
      required String email,
      required String confirmPassword,
      required String password});

  Future<Result<BaseResponseDto>> forgetPassword({required String email});

  Future<Result<BaseResponseDto>> verifyEmail({required String email});

 Future<Result<GetProfileDto>>  getProfile();
}
