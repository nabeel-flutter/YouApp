import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_cubit_state.dart';
part 'appointment_cubit_cubit.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentCubitState> {
  AppointmentCubit() : super(const AppointmentCubitState.initial());
  String timeSlot = 'Select Time Slot';
  List<String> timeSlotList = [
    "60 Minutes",
    "45 Minutes",
    "30 Minutes",
  ];
  String service = 'Select Service';
  List<String> servicesList = [
    "Psychiatric Evaluation",
    "Medication Management",
    "Individual Counseling",
    "Primary Care",
    "PCD Follow Up",
  ];

  String reasonForAppointment = 'Preferred Method For Service';
  List<String> reasonForAppointmentList = [
    'I Need Primary Care Service',
    "I Don't Need Primary Care Service"
  ];

  void selectDate(DateTime? selectedDate) {
    debugPrint('selectedDate: $selectedDate');
    emit(AppointmentCubitState.selectedDate(selectedDate));
  }

  void selectReasonForAppointment(String? selectedReason) {
    reasonForAppointment = selectedReason!;
    emit(AppointmentCubitState.selectedReasonForAppointment(selectedReason));
  }

  void selectTime(String? selectedTime) {
    debugPrint('selectedTime: $selectedTime');
    emit(AppointmentCubitState.selectedTime(selectedTime));
  }

  void selectService(String? selectedService) {
    service = selectedService!;
    emit(AppointmentCubitState.selectedService(selectedService));
  }

  void selectTimeSlot(String? selectedTimeSlot) {
    timeSlot = selectedTimeSlot!;
    emit(AppointmentCubitState.selectedTimeSlot(selectedTimeSlot));

  }
}
