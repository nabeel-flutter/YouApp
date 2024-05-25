// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataListDto<T> _$DataListDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataListDto<T>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataListDtoToJson<T>(
  DataListDto<T> instance,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currentPage', instance.currentPage);
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('totalPages', instance.totalPages);
  writeNotNull('data', instance.data?.map(toJsonT).toList());
  return val;
}
