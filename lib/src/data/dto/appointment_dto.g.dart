// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDto _$AppointmentDtoFromJson(Map<String, dynamic> json) =>
    AppointmentDto(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      doctorId: json['doctor_id'] as int?,
      clinicId: json['clinic_id'] as int?,
      consultationFee: json['consultation_fee'] as int?,
      reason: json['reason'] as String?,
      type: json['type'] as String?,
      appointmentType: json['appointment_type'] as String?,
      prefix: json['prefix'] as String?,
      date: json['date'] as String?,
      prescriptionHere: json['prescription_here'] as String?,
      time: json['time'] as String?,
      dateTime: json['date_time'] as String?,
      remainingTime: json['remaining_time'] as int?,
      progress: json['progress'] as String?,
      isPaid: json['is_paid'] as bool?,
      status: json['status'] as bool?,
      prescription: json['prescription'] == null
          ? null
          : PrescriptionDto.fromJson(
              json['prescription'] as Map<String, dynamic>),
    )..doctor = json['doctor'] == null
        ? null
        : DoctorDto.fromJson(json['doctor'] as Map<String, dynamic>);

Map<String, dynamic> _$AppointmentDtoToJson(AppointmentDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('doctor_id', instance.doctorId);
  writeNotNull('clinic_id', instance.clinicId);
  writeNotNull('consultation_fee', instance.consultationFee);
  writeNotNull('reason', instance.reason);
  writeNotNull('type', instance.type);
  writeNotNull('appointment_type', instance.appointmentType);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('date', instance.date);
  writeNotNull('time', instance.time);
  writeNotNull('date_time', instance.dateTime);
  writeNotNull('remaining_time', instance.remainingTime);
  writeNotNull('progress', instance.progress);
  writeNotNull('is_paid', instance.isPaid);
  writeNotNull('status', instance.status);
  writeNotNull('prescription', instance.prescription?.toJson());
  writeNotNull('doctor', instance.doctor?.toJson());
  writeNotNull('prescription_here', instance.prescriptionHere);
  return val;
}
