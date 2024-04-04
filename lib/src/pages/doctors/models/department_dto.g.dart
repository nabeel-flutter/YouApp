// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentDto _$DepartmentDtoFromJson(Map<String, dynamic> json) =>
    DepartmentDto(
      department: json['department'] as String,
      team: (json['team'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepartmentDtoToJson(DepartmentDto instance) =>
    <String, dynamic>{
      'department': instance.department,
      'team': instance.team,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as String?,
      image: json['image'] as String?,
      profile: json['profile'] as String?,
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      description: json['description'] as String?,
      suffix: json['suffix'] as String?,
      reviews: json['reviews'] as int?,
      ratings: (json['ratings'] as num?)?.toDouble(),
      experiences: json['experiences'] as int?,
      patients: json['patients'] as int?,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'profile': instance.profile,
      'name': instance.name,
      'designation': instance.designation,
      'description': instance.description,
      'suffix': instance.suffix,
      'reviews': instance.reviews,
      'ratings': instance.ratings,
      'experiences': instance.experiences,
      'patients': instance.patients,
    };
