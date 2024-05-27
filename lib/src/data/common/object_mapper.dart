import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';
import 'package:your_app_test/src/data/dto/base_response_dto.dart';
import 'package:your_app_test/src/data/dto/error_dto.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/data/dto/token_dto.dart';
import 'package:your_app_test/src/domain/domain.dart';
import 'package:your_app_test/src/domain/status/readings_status.dart';

class ObjectMapper {
  final Logger logger;

  ///
  /// Readings Rate status
  ///
  static const String _low = 'low';
  static const String _high = 'high';
  static const String _normal = 'normal';

  const ObjectMapper({required this.logger});

  ReadingsStatus toReadingStatus(String status) {
    String statusResult = status.toLowerCase();
    ReadingsStatus readingsStatus = const ReadingsStatus.normal();
    if (statusResult == _high) {
      readingsStatus = const ReadingsStatus.high();
    } else if (statusResult == _normal) {
      readingsStatus = const ReadingsStatus.normal();
    } else if (statusResult == _low) {
      readingsStatus = const ReadingsStatus.low();
    }
    return readingsStatus;
  }

  Error toError(Exception exception) {
    Error error;
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.cancel:
          error = const Error(message: 'Request to API server was cancelled');
          break;
        case DioExceptionType.connectionTimeout:
          error = const Error(message: 'Connection timeout with API server');
          break;
        case DioExceptionType.unknown:
          error = const Error(
            message: 'Error while trying to process your request,'
                ' check your network connection',
          );
          break;
        case DioExceptionType.receiveTimeout:
          error = const Error(
            message: 'Receive timeout in connection '
                'with API server',
          );
          break;
        case DioExceptionType.badResponse:
          final data = exception.response?.data;

          try {
            final dto = ErrorDto.fromJson(data);
            error = Error(code: dto.code, message: dto.message);
          } on CheckedFromJsonException catch (e) {
            error = Error(
              message: e.message ?? ErrorDto.kParsingError,
            );
          }
          break;
        case DioExceptionType.sendTimeout:
          error = const Error(
            message: 'Send timeout in connection'
                ' with API server',
          );
          break;
        // ignore: no_default_cases
        default:
          error = const Error(message: 'Something went wrong');
          break;
      }
    } else if (exception is CheckedFromJsonException) {
      error = Error(
        message: exception.message ?? ErrorDto.kParsingError,
      );
    } else {
      error = Error(message: exception.toString());
    }
    logger.e(
      'An error has occurred. code=${error.code}, message=${error.message}',
    );
    return error;
  }

  BaseResponseDto<TokenDto> toSignIn(BaseResponseDto<TokenDto> dto) {
    return BaseResponseDto<TokenDto>(data: dto.data, message: dto.message);
  }

  BaseResponseDto<TokenDto> toSignUp(BaseResponseDto<TokenDto> dto) {
    return BaseResponseDto<TokenDto>(data: dto.data, message: dto.message);
  }

  BaseResponseDto toforgetPassword(BaseResponseDto dto) {
    return BaseResponseDto(data: dto.data, message: dto.data['message']);
  }

  BaseResponseDto toVerifyEmail(BaseResponseDto dto) {
    return BaseResponseDto(data: dto.data, message: dto.data['message']);
  }

  BaseResponseDto toUpdateUser(BaseResponseDto dto) {
    return BaseResponseDto(data: dto.data, message: dto.data['message']);
  }

   GetProfileDto toProfile(GetProfileDto dto) {
    return GetProfileDto(name: dto.name ,
    birthday: dto.birthday,
    height: dto.height
    ,
    username: dto.username,
    zodiac: dto.zodiac,
    horoscope: dto.horoscope,
    weight: dto.weight,
    interests: dto.interests

    
    );
  }
}
