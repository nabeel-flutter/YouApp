import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ErrorDto {
  static const int kUnknown = -1;
  static const String kUnknownMessage = 'Unknown Error';
  static const String kParsingError = 'Error while trying to parse the object';

  @JsonKey(defaultValue: kUnknown)
  final int code;

  @JsonKey(defaultValue: kUnknownMessage)
  final String message;

  const ErrorDto({
    required this.code,
    required this.message,
  });

  factory ErrorDto.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      if (json['message'] is List) {
        return ErrorDto(code: kUnknown, message: json['message'][0]);
      }
      return _$ErrorDtoFromJson(json);
    } else if (json is String && json.isNotEmpty) {
      return ErrorDto(code: kUnknown, message: json);
    } else {
      return const ErrorDto(code: kUnknown, message: kUnknownMessage);
    }
  }

  Map<String, dynamic> toJson() => _$ErrorDtoToJson(this);
}
