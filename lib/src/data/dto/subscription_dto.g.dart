// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionDto _$SubscriptionDtoFromJson(Map<String, dynamic> json) =>
    SubscriptionDto(
      remainingDays: (json['remaining_days'] as num?)?.toInt(),
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      package: json['package'] == null
          ? null
          : PackageDto.fromJson(json['package'] as Map<String, dynamic>),
      isYearly: (json['is_yearly'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubscriptionDtoToJson(SubscriptionDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('remaining_days', instance.remainingDays);
  writeNotNull('is_yearly', instance.isYearly);
  writeNotNull('start_date', instance.startDate);
  writeNotNull('end_date', instance.endDate);
  writeNotNull('package', instance.package?.toJson());
  return val;
}
