part of 'doctors_cubit.dart';

@freezed
class DoctorsState with _$DoctorsState {
  const factory DoctorsState.initial() = _Initial;
  const factory DoctorsState.loading() = _Loading;
  // ignore: non_constant_identifier_names
  const factory DoctorsState.Error({required String message}) = _Error;
  const factory DoctorsState.specialties({required List<String> specialties}) =
      _Specialties;
  const factory DoctorsState.loaded({required List<Doctor> doctors}) = _Loaded;
}
