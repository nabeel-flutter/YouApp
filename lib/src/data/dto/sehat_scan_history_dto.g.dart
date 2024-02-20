// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sehat_scan_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SehatScanHistoryDto _$SehatScanHistoryDtoFromJson(Map<String, dynamic> json) =>
    SehatScanHistoryDto(
      healthScans: (json['health_scans'] as List<dynamic>?)
          ?.map((e) => LastHealthScanDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SehatScanHistoryDtoToJson(SehatScanHistoryDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'health_scans', instance.healthScans?.map((e) => e.toJson()).toList());
  return val;
}
