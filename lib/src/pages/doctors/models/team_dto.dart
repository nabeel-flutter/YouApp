import 'package:json_annotation/json_annotation.dart';

part 'team_dto.g.dart';

@JsonSerializable()
class DepartmentDto {
  String department;
  List<Team> team;

  DepartmentDto({required this.department, required this.team});

  factory DepartmentDto.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentDtoToJson(this);
}

@JsonSerializable()
class Team {
  String id;
  String image;
  String profile;
  String name;
  String designation;
  String description;
  String suffix;
  int reviews;
  double ratings;
  int experiences;
  int patients;

  Team({
    required this.id,
    required this.image,
    required this.profile,
    required this.name,
    required this.designation,
    required this.description,
    required this.suffix,
    required this.reviews,
    required this.ratings,
    required this.experiences,
    required this.patients,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
