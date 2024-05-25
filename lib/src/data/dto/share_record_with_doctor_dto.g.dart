// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_record_with_doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareRecordWithDoctorDto _$ShareRecordWithDoctorDtoFromJson(
        Map<String, dynamic> json) =>
    ShareRecordWithDoctorDto(
      doctorId: (json['doctor_id'] as num?)?.toInt(),
      medicalRecordId: (json['medical_record_id'] as num?)?.toInt(),
      doctor: json['doctor'] == null
          ? null
          : DoctorDto.fromJson(json['doctor'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShareRecordWithDoctorDtoToJson(
    ShareRecordWithDoctorDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('doctor_id', instance.doctorId);
  writeNotNull('medical_record_id', instance.medicalRecordId);
  writeNotNull('doctor', instance.doctor?.toJson());
  writeNotNull('id', instance.id);
  return val;
}
