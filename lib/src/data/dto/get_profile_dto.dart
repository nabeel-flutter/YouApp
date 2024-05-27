import 'package:json_annotation/json_annotation.dart';
part 'get_profile_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class GetProfileDto {
  String? name;
  String? birthday;
  int? weight;
  int? height;
  final List<String>? interests;
  String? age;

  final String? username;
  final String? horoscope;
  final String? zodiac;

  set setName(String name) => this.name = name;
  set setHeight(int height) => this.height = height;
  set setWeight(int weight) => this.weight = weight;
  set setBirthday(String birthday) => this.birthday = birthday;

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

  void getAge(DateTime today, DateTime dob) =>
      age = (today.year - dob.year).toString();

  Map<String, dynamic> toJson() => _$GetProfileDtoToJson(this);
}
