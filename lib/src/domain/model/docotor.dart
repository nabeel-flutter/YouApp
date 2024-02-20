class Doctor {
  int id;
  String role;
  String name;
  String city;
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
  List<String>? collaborations;
  bool? isAvailable;
  String? redirectUrl;
  List<String> ? doctorSpecialities;
  List<String> ?doctorEducations;
  dynamic totalReviews;
  dynamic reviewCount;
  String? clinic;

  bool? isShared;
  int? sharedMedicalRecordId;
  Doctor({
    required this.id,
    this.sharedMedicalRecordId,
    this.isShared,
    required this.role,
    required this.name,
    required this.city,
    this.image,
    this.age,
    required this.gender,
    required this.prefix,
    required this.isSubscribed,
    required this.isInstantConsultation,
    required this.isPhysicalConsultancy,
    required this.waitingTime,
    required this.consultationDuration,
    required this.about,
    required this.badge,
    required this.pmcNo,
    required this.experienceYear,
    required this.collaborations,
    required this.isAvailable,
    required this.redirectUrl,
    required this.doctorSpecialities,
    required this.doctorEducations,
    required this.totalReviews,
    required this.reviewCount,
    required this.clinic,
  });
}
