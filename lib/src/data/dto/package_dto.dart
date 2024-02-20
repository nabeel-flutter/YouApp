import 'package:json_annotation/json_annotation.dart';

part 'package_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class PackageDto {
  String? name;
  String? durationText;
  String? durationTextYearly;
  String? colorCode;
  int? price;
  int? priceYearly;
  int? discountedPrice;

  int? discountedYearlyPrice;

  PackageDto({
    this.discountedYearlyPrice,
    this.name,
    this.durationText,
    this.durationTextYearly,
    this.colorCode,
    this.price,
    this.priceYearly,
    this.discountedPrice,
  });

  factory PackageDto.fromJson(Map<String, dynamic> json) =>
      _$PackageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PackageDtoToJson(this);
}
