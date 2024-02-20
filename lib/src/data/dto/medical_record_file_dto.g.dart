// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordFileDto _$MedicalRecordFileDtoFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordFileDto(
      id: json['id'] as int?,
      medicalRecordId: json['medical_record_id'] as int?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$MedicalRecordFileDtoToJson(
    MedicalRecordFileDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('medical_record_id', instance.medicalRecordId);
  writeNotNull('file', instance.file);
  return val;
}
