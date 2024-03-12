
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'appointments_details_dto.g.dart';

AppointmentDetailsDto appointmentDetailsDtoFromJson(String str) => AppointmentDetailsDto.fromJson(json.decode(str));

String appointmentDetailsDtoToJson(AppointmentDetailsDto data) => json.encode(data.toJson());

@JsonSerializable()
class AppointmentDetailsDto {
    @JsonKey(name: "success")
    bool success;
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "paymentType")
    String paymentType;
    @JsonKey(name: "services")
    List<Service> services;

    AppointmentDetailsDto({
        required this.success,
        required this.message,
        required this.paymentType,
        required this.services,
    });

    factory AppointmentDetailsDto.fromJson(Map<String, dynamic> json) => _$AppointmentDetailsDtoFromJson(json);

    Map<String, dynamic> toJson() => _$AppointmentDetailsDtoToJson(this);
}

@JsonSerializable()
class Service {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "slots")
    List<Slot> slots;

    Service({
        required this.id,
        required this.name,
        required this.slots,
    });

    factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

    Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

@JsonSerializable()
class Slot {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "price")
    int price;
    @JsonKey(name: "time")
    String time;

    Slot({
        required this.id,
        required this.price,
        required this.time,
    });

    factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

    Map<String, dynamic> toJson() => _$SlotToJson(this);
}
