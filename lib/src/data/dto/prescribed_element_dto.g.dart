// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescribed_element_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescribedElementDto _$PrescribedElementDtoFromJson(
        Map<String, dynamic> json) =>
    PrescribedElementDto(
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PrescribedElementDtoToJson(
    PrescribedElementDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  return val;
}
