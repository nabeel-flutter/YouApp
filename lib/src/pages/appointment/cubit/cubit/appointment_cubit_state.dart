part of 'appointment_cubit_cubit.dart';

@freezed
class AppointmentCubitState with _$AppointmentCubitState {
  const factory AppointmentCubitState.initial() = _Initial;
  const factory AppointmentCubitState.selectedDate(DateTime? selectedDate) =
      _SelectedDate;
  const factory AppointmentCubitState.selectedTime(String? selectedTime) =
      _SelectedTime;
  const factory AppointmentCubitState.selectedReasonForAppointment(
      String? selectedReason) = _SelectedReasonForAppointment;
}
