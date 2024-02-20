import 'package:json_annotation/json_annotation.dart';

part 'doctor_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class DoctorDto {
  int? id;
  String? role;
  String? name;
  int? cityId;
  String? city;
  String? image;
  int? age;
  String? gender;
  String? prefix;
  bool? isSubscribed;
  bool? isInstantConsultation;
  bool? isPhysicalConsultancy;
  int? waitingTime;
  String? consultationDuration;
  String? about;
  String? badge;
  String? pmcNo;
  int? experienceYear;
  bool? isAvailable;
  String? redirectUrl;
  List<String>? doctorSpecialities;
  List<String>? doctorEducations;
  dynamic totalReviews;
  dynamic reviewCount;
  String? clinic;

  bool? isShared;
  int? sharedMedicalRecordId;

  DoctorDto({
    this.id,
    this.isShared,
    this.role,
    this.name,
    this.cityId,
    this.city,
    this.image,
    this.age,
    this.gender,
    this.prefix,
    this.sharedMedicalRecordId,
    this.isSubscribed,
    this.isInstantConsultation,
    this.isPhysicalConsultancy,
    this.waitingTime,
    this.consultationDuration,
    this.about,
    this.badge,
    this.pmcNo,
    this.clinic,
  });

  factory DoctorDto.fromJson(Map<String, dynamic> json) =>
      _$DoctorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDtoToJson(this);
}
