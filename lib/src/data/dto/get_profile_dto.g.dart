// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileDto _$GetProfileDtoFromJson(Map<String, dynamic> json) =>
    GetProfileDto(
      age: json['age'] as String?,
      username: json['username'] as String?,
      horoscope: json['horoscope'] as String?,
      zodiac: json['zodiac'] as String?,
      birthday: json['birthday'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GetProfileDtoToJson(GetProfileDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('birthday', instance.birthday);
  writeNotNull('weight', instance.weight);
  writeNotNull('height', instance.height);
  writeNotNull('interests', instance.interests);
  writeNotNull('age', instance.age);
  writeNotNull('username', instance.username);
  writeNotNull('horoscope', instance.horoscope);
  writeNotNull('zodiac', instance.zodiac);
  return val;
}
