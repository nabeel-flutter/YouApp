import 'package:logger/logger.dart';
import 'package:e_finder/src/data/common/object_mapper.dart';
import 'package:e_finder/src/data/datasource/api/at_care_api.dart';
import 'package:e_finder/src/data/dto/base_response_dto.dart';
import 'package:e_finder/src/data/dto/get_profile_dto.dart';
import 'package:e_finder/src/data/dto/token_dto.dart';
import 'package:e_finder/src/domain/domain.dart';

class ApiRepositoryImpl extends ApiRepository {
  final YouAppApi youAppApi;
  final ObjectMapper objectMapper;
  final Logger logger;

  ApiRepositoryImpl({
    required this.youAppApi,
    required this.objectMapper,
    required this.logger,
  });

  @override
  Future<Result<BaseResponseDto<TokenDto>>> signIn(
      {required String email, required String password}) async {
    try {
      final response = await youAppApi.signIn(password: password, email: email);
      return Result.success(objectMapper.toSignIn(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto<TokenDto>>> signUp(
      {required String userName,
      required String email,
      required String confirmPassword,
      required String password}) async {
    try {
      final response = await youAppApi.signUp(
        confirmPassword: confirmPassword,
        email: email,
        userName: userName,
        password: password,
      );
      return Result.success(objectMapper.toSignUp(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto>> forgetPassword(
      {required String email}) async {
    try {
      final response = await youAppApi.forgetPassword(
        email: email,
      );
      return Result.success(objectMapper.toforgetPassword(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<BaseResponseDto>> verifyEmail({required String email}) async {
    try {
      final response = await youAppApi.verifyEmail(
        email: email,
      );
      return Result.success(objectMapper.toVerifyEmail(response));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<GetProfileDto>> getProfile() async {
    try {
      final response = await youAppApi.getProfile();
      return Result.success(objectMapper.toProfile(response.data!));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
  }

  @override
  Future<Result<GetProfileDto>> updateProfile() async {
    try {
      final response = await youAppApi.updateProfile();
      return Result.success(objectMapper.toUpdateProfile(response.data!));
    } on Exception catch (e) {
      logger.e(e);
      return Result.failed(objectMapper.toError(e));
    }
    // TODO: implement updateProfile
  }
}
