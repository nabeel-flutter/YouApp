import 'package:json_annotation/json_annotation.dart';

part 'medical_record_file_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class MedicalRecordFileDto {
  int? id;
  int? medicalRecordId;
  String? file;
  MedicalRecordFileDto({
    this.id,
    this.medicalRecordId,
    this.file,
  });

  factory MedicalRecordFileDto.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordFileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalRecordFileDtoToJson(this);
}
