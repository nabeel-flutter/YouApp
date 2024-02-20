// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_health_scan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastHealthScanDto _$LastHealthScanDtoFromJson(Map<String, dynamic> json) =>
    LastHealthScanDto(
      id: json['id'] as int?,
      stressLevel: json['stress_level'] as String?,
      stressLevelValue: json['stress_level_value'] as String?,
      stressLevelColor: json['stress_level_color'] as String?,
      sehatScaore: json['sehat_scaore'] as int?,
      date: json['date'] as String?,
      bloodPressureValue: json['blood_pressure_value'] as String?,
      bloodPressure: json['blood_pressure'] as String?,
      bloodPressureColor: json['blood_pressure_color'] as String?,
      heartRate: json['heart_rate'] as String?,
      heartRateValue: json['heart_rate_value'] as String?,
      heartRateColor: json['heart_rate_color'] as String?,
      respiratoryRate: json['respiratory_rate'] as String?,
      respiratoryRateValue: json['respiratory_rate_value'] as String?,
      respiratoryRateColor: json['respiratory_rate_color'] as String?,
      spo2: json['spo2'] as String?,
      spo2Value: json['spo2_value'] as String?,
      spo2Color: json['spo2_color'] as String?,
      sdnn: json['sdnn'] as String?,
      sdnnValue: json['sdnn_value'] as String?,
      sdnnColor: json['sdnn_color'] as String?,
      score: json['score'] as String?,
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$LastHealthScanDtoToJson(LastHealthScanDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date);
  writeNotNull('blood_pressure_value', instance.bloodPressureValue);
  writeNotNull('blood_pressure', instance.bloodPressure);
  writeNotNull('blood_pressure_color', instance.bloodPressureColor);
  writeNotNull('heart_rate', instance.heartRate);
  writeNotNull('heart_rate_value', instance.heartRateValue);
  writeNotNull('heart_rate_color', instance.heartRateColor);
  writeNotNull('respiratory_rate', instance.respiratoryRate);
  writeNotNull('respiratory_rate_value', instance.respiratoryRateValue);
  writeNotNull('respiratory_rate_color', instance.respiratoryRateColor);
  writeNotNull('spo2', instance.spo2);
  writeNotNull('spo2_value', instance.spo2Value);
  writeNotNull('spo2_color', instance.spo2Color);
  writeNotNull('sdnn', instance.sdnn);
  writeNotNull('sdnn_value', instance.sdnnValue);
  writeNotNull('sdnn_color', instance.sdnnColor);
  writeNotNull('score', instance.score);
  writeNotNull('sehat_scaore', instance.sehatScaore);
  writeNotNull('dateTime', instance.dateTime);
  writeNotNull('stress_level', instance.stressLevel);
  writeNotNull('stress_level_value', instance.stressLevelValue);
  writeNotNull('stress_level_color', instance.stressLevelColor);
  writeNotNull('id', instance.id);
  return val;
}
