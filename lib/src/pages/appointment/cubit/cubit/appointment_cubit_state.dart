part of 'appointment_cubit_cubit.dart';

@freezed
class AppointmentCubitState with _$AppointmentCubitState {
  const factory AppointmentCubitState.initial() = _Initial;
  const factory AppointmentCubitState.loading() = _Loading;
  const factory AppointmentCubitState.loaded() = _Loaded;
  const factory AppointmentCubitState.selectedDate(DateTime? selectedDate) =
      _SelectedDate;
  const factory AppointmentCubitState.selectedTime(String? selectedTime) =
      _SelectedTime;
  const factory AppointmentCubitState.selectedService(String? selectedService) = _SelectedService;     
  const factory AppointmentCubitState.selectedReasonForAppointment(
      String? selectedReason) = _SelectedReasonForAppointment;
  const factory AppointmentCubitState.selectedTimeSlot(String? selectedTimeSlot) = _SelectedTimeSlot;
  const factory AppointmentCubitState.selectedPaymentMode(int? selectedPaymentMode) = _SelectedPaymentMode;
}
