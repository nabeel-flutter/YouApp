import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_beginnings/src/pages/doctors/models/doctor_model.dart';

import 'package:new_beginnings/src/constant/assets_constants.dart';

part 'doctors_state.dart';
part 'doctors_cubit.freezed.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit() : super(const DoctorsState.initial());

  final List<Doctor> doctors = [
    Doctor(
      name: "Dr. Alexa Doe",
      specialty: "Psychiatrist",
      image: AssetsConstants.doctorDetailImage,
      description:
          "Dr. Alexa Doe is a psychiatrist with 10 years of experience. She has worked with various hospitals and has a good reputation in the field of psychiatry, She has worked with various hospitals and has a good reputation in the field of psychiatry.",
      rating: "4.5",
      reviews: "200",
      noOfPatients: "2000",
      yearsOfExperience: "10",
    ),
    Doctor(
      name: "Dr. John Doe",
      specialty: "Psychiatrist",
      image: AssetsConstants.doctorDetailImage,
      description:
          "Dr. John Doe is a psychiatrist with 10 years of experience. He has worked with various hospitals and has a good reputation in the field of psychiatry, He has worked with various hospitals and has a good reputation in the field of psychiatry.",
      rating: "4.4",
      reviews: "100",
      noOfPatients: "1000",
      yearsOfExperience: "10",
    ),
    Doctor(
      name: "Dr. Peter Doe",
      specialty: "Psychiatrist",
      image: AssetsConstants.doctorDetailImage,
      description:
          "Dr. Peter Doe is a psychiatrist with 10 years of experience. He has worked with various hospitals and has a good reputation in the field of psychiatry, He has worked with various hospitals and has a good reputation in the field of psychiatry.",
      rating: "4.4",
      reviews: "100",
      noOfPatients: "1000",
      yearsOfExperience: "10",
    ),
    Doctor(
      name: "Dr. Alexa Doe",
      specialty: "Cardiologist",
      image: AssetsConstants.doctorDetailImage,
      description:
          "Dr. Alexa Doe is a psychiatrist with 10 years of experience. She has worked with various hospitals and has a good reputation in the field of psychiatry, She has worked with various hospitals and has a good reputation in the field of psychiatry.",
      rating: "4.5",
      reviews: "200",
      noOfPatients: "2000",
      yearsOfExperience: "10",
    ),
    Doctor(
      name: "Dr. John Doe",
      specialty: "Cardiologist",
      image: AssetsConstants.doctorDetailImage,
      description:
          "Dr. John Doe is a psychiatrist with 10 years of experience. He has worked with various hospitals and has a good reputation in the field of psychiatry, He has worked with various hospitals and has a good reputation in the field of psychiatry.",
      rating: "4.4",
      reviews: "100",
      noOfPatients: "1000",
      yearsOfExperience: "10",
    ),
    Doctor(
      name: "Dr. Peter Doe",
      specialty: "Psychiatrist",
      image: AssetsConstants.doctorDetailImage,
      description:
          "Dr. Peter Doe is a psychiatrist with 10 years of experience. He has worked with various hospitals and has a good reputation in the field of psychiatry, He has worked with various hospitals and has a good reputation in the field of psychiatry.",
      rating: "4.4",
      reviews: "100",
      noOfPatients: "1000",
      yearsOfExperience: "10",
    ),
  ];
  List<Doctor> filteredDoctors = [];
  List<String> specaialty = [
    "All",
    "Cardiologist",
    "Dentist",
    "Dermatologist",
    "ENT Specialist",
    "Gynecologist",
    "Neurologist",
    "Ophthalmologist",
    "Orthopedic",
    "Pediatrician",
    "Psychiatrist",
    "Urologist",
  ];

  // void getDoctors() {
  //   emit(DoctorsState.loaded(doctors: doctors));
  // }

  void filterDoctorsBySpecialty(String specialty) {
    if (specialty == 'All') {
      emit(DoctorsState.loaded(doctors: doctors));
    } else if (specialty.isEmpty) {
      emit(DoctorsState.loaded(doctors: doctors));
    } else {
      filteredDoctors =
          doctors.where((doctor) => doctor.specialty == specialty).toList();
      emit(DoctorsState.loaded(doctors: filteredDoctors));
    }
  }
}
