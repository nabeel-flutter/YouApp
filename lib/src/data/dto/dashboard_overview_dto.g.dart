// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_overview_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardOverViewDto _$DashBoardOverViewDtoFromJson(
        Map<String, dynamic> json) =>
    DashBoardOverViewDto(
      familyMember: json['family_member'] as int?,
      healthScans: json['health_scans'] as int?,
      medicalRecords: json['medical_records'] as int?,
      totalReviews: json['total_reviews'] as int?,
      totalAppointments: json['total_appointments'] as int?,
      inPersonAppointments: json['in_person_appointments'] as int?,
      virtualAppointments: json['virtual_appointments'] as int?,
      instantConsultations: json['instant_consultations'] as int?,
      totalUpcomingAppointments: json['total_upcoming_appointments'] as int?,
      lastHealthScan: json['last_health_scan'] == null
          ? null
          : LastHealthScanDto.fromJson(
              json['last_health_scan'] as Map<String, dynamic>),
      familyMembers: json['family_members'] as int?,
      subscription: json['subscription'] == null
          ? null
          : SubscriptionDto.fromJson(
              json['subscription'] as Map<String, dynamic>),
      lastPrescription: json['last_prescription'] == null
          ? null
          : PrescriptionDto.fromJson(
              json['last_prescription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashBoardOverViewDtoToJson(
    DashBoardOverViewDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('family_member', instance.familyMember);
  writeNotNull('health_scans', instance.healthScans);
  writeNotNull('medical_records', instance.medicalRecords);
  writeNotNull('total_reviews', instance.totalReviews);
  writeNotNull('total_appointments', instance.totalAppointments);
  writeNotNull('in_person_appointments', instance.inPersonAppointments);
  writeNotNull('virtual_appointments', instance.virtualAppointments);
  writeNotNull('instant_consultations', instance.instantConsultations);
  writeNotNull(
      'total_upcoming_appointments', instance.totalUpcomingAppointments);
  writeNotNull('family_members', instance.familyMembers);
  writeNotNull('last_health_scan', instance.lastHealthScan?.toJson());
  writeNotNull('subscription', instance.subscription?.toJson());
  writeNotNull('last_prescription', instance.lastPrescription?.toJson());
  return val;
}
