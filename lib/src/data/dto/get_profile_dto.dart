import 'package:json_annotation/json_annotation.dart';
part 'get_profile_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class GetProfileDto {
  final String? name;
  final String? birthday;
  final int? weight;
  final int? height;
  final List<String>? interests;
  String? age;

  final String? username;
  final String? horoscope;
  final String? zodiac;


  GetProfileDto(
      {this.age,
      this.username,
      this.horoscope,
      this.zodiac,
      this.birthday,
      this.weight,
      this.height,
      this.interests,
      this.name});

  factory GetProfileDto.fromJson(Map<String, dynamic> json) =>
      _$GetProfileDtoFromJson(json);


  void getAge(DateTime today, DateTime dob) => age = (today.year - dob.year).toString();

  Map<String, dynamic> toJson() => _$GetProfileDtoToJson(this);
}
