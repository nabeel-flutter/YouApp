part of 'verify_email_cubit.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial() = _Initial;

  const factory VerifyEmailState.loading() = _Loading;

  const factory VerifyEmailState.error(String message) = _Error;

  const factory VerifyEmailState.loaded(String mesaage) = _Loaded;

}
