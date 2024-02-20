// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDto _$DoctorDtoFromJson(Map<String, dynamic> json) => DoctorDto(
      id: json['id'] as int?,
      isShared: json['is_shared'] as bool?,
      role: json['role'] as String?,
      name: json['name'] as String?,
      cityId: json['city_id'] as int?,
      city: json['city'] as String?,
      image: json['image'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      prefix: json['prefix'] as String?,
      sharedMedicalRecordId: json['shared_medical_record_id'] as int?,
      isSubscribed: json['is_subscribed'] as bool?,
      isInstantConsultation: json['is_instant_consultation'] as bool?,
      isPhysicalConsultancy: json['is_physical_consultancy'] as bool?,
      waitingTime: json['waiting_time'] as int?,
      consultationDuration: json['consultation_duration'] as String?,
      about: json['about'] as String?,
      badge: json['badge'] as String?,
      pmcNo: json['pmc_no'] as String?,
      clinic: json['clinic'] as String?,
    )
      ..experienceYear = json['experience_year'] as int?
      ..isAvailable = json['is_available'] as bool?
      ..redirectUrl = json['redirect_url'] as String?
      ..doctorSpecialities = (json['doctor_specialities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..doctorEducations = (json['doctor_educations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..totalReviews = json['total_reviews']
      ..reviewCount = json['review_count'];

Map<String, dynamic> _$DoctorDtoToJson(DoctorDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('role', instance.role);
  writeNotNull('name', instance.name);
  writeNotNull('city_id', instance.cityId);
  writeNotNull('city', instance.city);
  writeNotNull('image', instance.image);
  writeNotNull('age', instance.age);
  writeNotNull('gender', instance.gender);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('is_subscribed', instance.isSubscribed);
  writeNotNull('is_instant_consultation', instance.isInstantConsultation);
  writeNotNull('is_physical_consultancy', instance.isPhysicalConsultancy);
  writeNotNull('waiting_time', instance.waitingTime);
  writeNotNull('consultation_duration', instance.consultationDuration);
  writeNotNull('about', instance.about);
  writeNotNull('badge', instance.badge);
  writeNotNull('pmc_no', instance.pmcNo);
  writeNotNull('experience_year', instance.experienceYear);
  writeNotNull('is_available', instance.isAvailable);
  writeNotNull('redirect_url', instance.redirectUrl);
  writeNotNull('doctor_specialities', instance.doctorSpecialities);
  writeNotNull('doctor_educations', instance.doctorEducations);
  writeNotNull('total_reviews', instance.totalReviews);
  writeNotNull('review_count', instance.reviewCount);
  writeNotNull('clinic', instance.clinic);
  writeNotNull('is_shared', instance.isShared);
  writeNotNull('shared_medical_record_id', instance.sharedMedicalRecordId);
  return val;
}
