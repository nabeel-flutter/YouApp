// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseDto<T> _$BaseResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponseDto<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseDtoToJson<T>(
  BaseResponseDto<T> instance,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', _$nullableGenericToJson(instance.data, toJsonT));
  writeNotNull('status', instance.status);
  writeNotNull('message', instance.message);
  return val;
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
