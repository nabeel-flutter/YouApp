class Doctor {
  final String name;
  final String specialty;
  final String image;
  final String? description;
  final String? rating;
  final String? reviews;
  final String? noOfPatients;
  final String? yearsOfExperience;

  Doctor({
    required this.name,
    required this.specialty,
    required this.image,
    this.description,
    this.rating,
    this.reviews,
    this.noOfPatients,
    this.yearsOfExperience,
  });
}
