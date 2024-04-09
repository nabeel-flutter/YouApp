// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_bills_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayBillsDto _$PayBillsDtoFromJson(Map<String, dynamic> json) => PayBillsDto(
      paymentLink: json['payment_link'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$PayBillsDtoToJson(PayBillsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payment_link', instance.paymentLink);
  writeNotNull('success', instance.success);
  return val;
}
