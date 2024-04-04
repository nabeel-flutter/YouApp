import 'package:json_annotation/json_annotation.dart';

part 'department_dto.g.dart';

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
  String? id;
  String? image;
  String? profile;
  String? name;
  String? designation;
  String? description;
  String? suffix;
  int? reviews;
  double? ratings;
  int? experiences;
  int? patients;

  Team({
     this.id,
     this.image,
     this.profile,
     this.name,
     this.designation,
     this.description,
     this.suffix,
     this.reviews,
     this.ratings,
     this.experiences,
     this.patients,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
