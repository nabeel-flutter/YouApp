// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_records_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordsHistoryDto _$MedicalRecordsHistoryDtoFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordsHistoryDto(
      medicalRecords: (json['medical_records'] as List<dynamic>?)
          ?.map((e) => MedicalRecordsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicalRecordsHistoryDtoToJson(
    MedicalRecordsHistoryDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('medical_records',
      instance.medicalRecords?.map((e) => e.toJson()).toList());
  return val;
}
