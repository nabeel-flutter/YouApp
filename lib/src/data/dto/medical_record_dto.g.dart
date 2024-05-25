// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordsDto _$MedicalRecordsDtoFromJson(Map<String, dynamic> json) =>
    MedicalRecordsDto(
      createdAt: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      fileName: json['file_name'] as String?,
      prescriptionId: (json['prescription_id'] as num?)?.toInt(),
      conditions: json['conditions'] as String?,
      totalReports: json['total_reports'],
      sharedWithDoctorsCount:
          (json['shared_with_doctors_count'] as num?)?.toInt(),
      date: json['date'] as String?,
      status: json['status'] as bool?,
      reportsForUser: json['reports_for_user'] as String?,
      sharedWithDoctors: (json['shared_with_doctors'] as List<dynamic>?)
          ?.map((e) =>
              ShareRecordWithDoctorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      medicalRecordFiles: (json['medical_record_files'] as List<dynamic>?)
          ?.map((e) => MedicalRecordFileDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicalRecordsDtoToJson(MedicalRecordsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('prescription_id', instance.prescriptionId);
  writeNotNull('conditions', instance.conditions);
  writeNotNull('file_name', instance.fileName);
  writeNotNull('total_reports', instance.totalReports);
  writeNotNull('shared_with_doctors_count', instance.sharedWithDoctorsCount);
  writeNotNull('date', instance.date);
  writeNotNull('status', instance.status);
  writeNotNull('reports_for_user', instance.reportsForUser);
  writeNotNull('shared_with_doctors',
      instance.sharedWithDoctors?.map((e) => e.toJson()).toList());
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('medical_record_files',
      instance.medicalRecordFiles?.map((e) => e.toJson()).toList());
  return val;
}
