part of 'book_appointment_cubit.dart';

@freezed
class BookAppointmentState with _$BookAppointmentState {
  const factory BookAppointmentState.initial() = _Initial;
  const factory BookAppointmentState.loaded() = _Loaded;
  const factory BookAppointmentState.loading() = _Loading;
  const factory BookAppointmentState.errorl() = _Error;
  
}
