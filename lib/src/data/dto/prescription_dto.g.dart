// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionDto _$PrescriptionDtoFromJson(Map<String, dynamic> json) =>
    PrescriptionDto(
      id: json['id'] as int?,
      appointmentId: json['appointment_id'] as int?,
      cosultationNote: json['cosultation_note'] as String?,
      bloodGroup: json['blood_group'] as String?,
      status: json['status'] as bool?,
      patientConsultationNote: json['patient_consultation_note'] as String?,
      prescribedMedicine: (json['prescribed_medicine'] as List<dynamic>?)
          ?.map((e) => PrescribedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      prescribedLab: (json['prescribed_lab'] as List<dynamic>?)
          ?.map((e) => PrescribedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      prescriptionHere: json['prescription_here'] as String?,
    );

Map<String, dynamic> _$PrescriptionDtoToJson(PrescriptionDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('appointment_id', instance.appointmentId);
  writeNotNull('cosultation_note', instance.cosultationNote);
  writeNotNull('blood_group', instance.bloodGroup);
  writeNotNull('status', instance.status);
  writeNotNull('patient_consultation_note', instance.patientConsultationNote);
  writeNotNull('prescribed_medicine',
      instance.prescribedMedicine?.map((e) => e.toJson()).toList());
  writeNotNull('prescribed_lab',
      instance.prescribedLab?.map((e) => e.toJson()).toList());
  writeNotNull('prescription_here', instance.prescriptionHere);
  return val;
}
