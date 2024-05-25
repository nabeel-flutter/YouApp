// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageDto _$PackageDtoFromJson(Map<String, dynamic> json) => PackageDto(
      discountedYearlyPrice: (json['discounted_yearly_price'] as num?)?.toInt(),
      name: json['name'] as String?,
      durationText: json['duration_text'] as String?,
      durationTextYearly: json['duration_text_yearly'] as String?,
      colorCode: json['color_code'] as String?,
      price: (json['price'] as num?)?.toInt(),
      priceYearly: (json['price_yearly'] as num?)?.toInt(),
      discountedPrice: (json['discounted_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PackageDtoToJson(PackageDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('duration_text', instance.durationText);
  writeNotNull('duration_text_yearly', instance.durationTextYearly);
  writeNotNull('color_code', instance.colorCode);
  writeNotNull('price', instance.price);
  writeNotNull('price_yearly', instance.priceYearly);
  writeNotNull('discounted_price', instance.discountedPrice);
  writeNotNull('discounted_yearly_price', instance.discountedYearlyPrice);
  return val;
}
