class Doctor {
  final String name;
  final String speciality;
  final String image;
  final String? description;
  final String? rating;
  final String? reviews;
  final String? noOfPatients;
  final String? yearsOfExperience;

  Doctor({
    required this.name,
    required this.speciality,
    required this.image,
    this.description,
    this.rating,
    this.reviews,
    this.noOfPatients,
    this.yearsOfExperience,
  });
}
