
import 'package:json_annotation/json_annotation.dart';

part 'base_response_dto.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  explicitToJson: true,
  includeIfNull: false,
)
class BaseResponseDto<T> {
  final T? data;
  final bool? status;
  final String? message;
  BaseResponseDto({
    required this.data,
    this.status,
    this.message,
  });

  factory BaseResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseDtoFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$BaseResponseDtoToJson(this, toJsonT);
}
