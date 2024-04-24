import 'package:json_annotation/json_annotation.dart';
import 'package:your_app_test/src/pages/doctors/models/department_dto.dart';

part 'team_dto.g.dart';

@JsonSerializable()
class TeamDto {

  List<DepartmentDto> data;
  
  TeamDto({required this.data,});

  factory TeamDto.fromJson(Map<String, dynamic> json) =>
      _$TeamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TeamDtoToJson(this);
}

