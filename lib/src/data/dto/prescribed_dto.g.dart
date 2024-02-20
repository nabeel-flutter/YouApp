// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescribed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescribedDto _$PrescribedDtoFromJson(Map<String, dynamic> json) =>
    PrescribedDto(
      id: json['id'] as int?,
      unit: json['unit'] as String?,
      prescriptionId: json['prescription_id'] as int?,
      prescriptionElementId: json['prescription_element_id'] as int?,
      numberOfDays: json['number_of_days'] as String?,
      dosage: json['dosage'] as int?,
      perDay: json['per_day'] as int?,
      isAfterMeal: json['is_after_meal'] as bool?,
      morning: json['morning'] as String?,
      evening: json['evening'] as String?,
      night: json['night'] as String?,
      prescriptionElement: json['prescription_element'] == null
          ? null
          : PrescribedElementDto.fromJson(
              json['prescription_element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrescribedDtoToJson(PrescribedDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('prescription_id', instance.prescriptionId);
  writeNotNull('prescription_element_id', instance.prescriptionElementId);
  writeNotNull('number_of_days', instance.numberOfDays);
  writeNotNull('dosage', instance.dosage);
  writeNotNull('per_day', instance.perDay);
  writeNotNull('is_after_meal', instance.isAfterMeal);
  writeNotNull('unit', instance.unit);
  writeNotNull('morning', instance.morning);
  writeNotNull('evening', instance.evening);
  writeNotNull('night', instance.night);
  writeNotNull('prescription_element', instance.prescriptionElement?.toJson());
  return val;
}
