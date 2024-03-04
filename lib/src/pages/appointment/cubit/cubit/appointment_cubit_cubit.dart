import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_cubit_state.dart';
part 'appointment_cubit_cubit.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentCubitState> {
  AppointmentCubit() : super(const AppointmentCubitState.initial());

  void selectDate(DateTime? selectedDate) {
    debugPrint('selectedDate: $selectedDate');
    emit(AppointmentCubitState.selectedDate(selectedDate));
  }

  void selectTime(String? selectedTime) {
    debugPrint('selectedTime: $selectedTime');
    emit(AppointmentCubitState.selectedTime(selectedTime));
  }
}
