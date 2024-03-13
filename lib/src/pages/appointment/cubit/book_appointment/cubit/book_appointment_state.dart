part of 'book_appointment_cubit.dart';

@freezed
class BookAppointmentState with _$BookAppointmentState {
  const factory BookAppointmentState.initial() = _Initial;
  const factory BookAppointmentState.loaded(BaseResponseDto<dynamic> data) = _Loaded;
  const factory BookAppointmentState.loading() = _Loading;
  const factory BookAppointmentState.error(String message) = _Error;
  
}
