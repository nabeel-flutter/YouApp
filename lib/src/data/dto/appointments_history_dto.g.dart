// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentsHistoryDto _$AppointmentsHistoryDtoFromJson(
        Map<String, dynamic> json) =>
    AppointmentsHistoryDto(
      pastAppointments: (json['past_appointments'] as List<dynamic>?)
          ?.map((e) => AppointmentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentsHistoryDtoToJson(
    AppointmentsHistoryDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('past_appointments',
      instance.pastAppointments?.map((e) => e.toJson()).toList());
  return val;
}
