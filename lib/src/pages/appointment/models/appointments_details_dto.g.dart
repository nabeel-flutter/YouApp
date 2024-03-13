// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDetailsDto _$AppointmentDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    AppointmentDetailsDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      paymentType: json['paymentType'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentDetailsDtoToJson(
        AppointmentDetailsDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'paymentType': instance.paymentType,
      'services': instance.services,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['_id'] as String,
      name: json['name'] as String,
      slots: (json['slots'] as List<dynamic>)
          .map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slots': instance.slots,
    };

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      id: json['_id'] as String,
      price: json['price'] as int,
      time: json['time'] as String,
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      '_id': instance.id,
      'price': instance.price,
      'time': instance.time,
    };
