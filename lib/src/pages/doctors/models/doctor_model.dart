class Doctor {
  final String name;
  final String speciality;
  final String image;
  final String? description;
  final String? rating;

  Doctor({
    required this.name,
    required this.speciality,
    required this.image,
    this.description,
    this.rating,
  });
}
