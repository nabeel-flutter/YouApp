import 'package:json_annotation/json_annotation.dart';

part 'pay_bills_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class PayBillsDto {
  String? paymentLink;
  bool? success;
  PayBillsDto({this.paymentLink, this.success});

  factory PayBillsDto.fromJson(Map<String, dynamic> json) =>
      _$PayBillsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PayBillsDtoToJson(this);
}
