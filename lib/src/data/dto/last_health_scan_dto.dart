
import 'package:json_annotation/json_annotation.dart';

part 'last_health_scan_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class LastHealthScanDto {
  final String? date;
  final String? bloodPressureValue;
  final String? bloodPressure;
  final String? bloodPressureColor;
  final String? heartRate;
  final String? heartRateValue;
  final String? heartRateColor;
  final String? respiratoryRate;
  final String? respiratoryRateValue;
  final String? respiratoryRateColor;
  final String? spo2;
  final String? spo2Value;
  final String? spo2Color;
  final String? sdnn;
  final String? sdnnValue;
  final String? sdnnColor;
  final String? score;
  final int? sehatScaore;
  @JsonKey(name: 'dateTime')
  final String? dateTime;

  final String? stressLevel;

  final String? stressLevelValue;

  final String? stressLevelColor;

  final int? id;
  const LastHealthScanDto({
    this.id, 
    this.stressLevel,
    this.stressLevelValue,
    this.stressLevelColor,
    this.sehatScaore,
    this.date,
    this.bloodPressureValue,
    this.bloodPressure,
    this.bloodPressureColor,
    this.heartRate,
    this.heartRateValue,
    this.heartRateColor,
    this.respiratoryRate,
    this.respiratoryRateValue,
    this.respiratoryRateColor,
    this.spo2,
    this.spo2Value,
    this.spo2Color,
    this.sdnn,
    this.sdnnValue,
    this.sdnnColor,
    this.score,
    this.dateTime,
  });

  factory LastHealthScanDto.fromJson(Map<String, dynamic> json) =>
      _$LastHealthScanDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LastHealthScanDtoToJson(this);
}
