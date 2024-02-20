import 'package:json_annotation/json_annotation.dart';

part 'prescribed_element_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class PrescribedElementDto {
  String? name;
  String? description;

  PrescribedElementDto({
    this.name,
    this.description,
  });

  factory PrescribedElementDto.fromJson(Map<String, dynamic> json) =>
      _$PrescribedElementDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PrescribedElementDtoToJson(this);
}
