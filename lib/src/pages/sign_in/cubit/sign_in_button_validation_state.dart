part of 'sign_in_button_validation_cubit.dart';


@freezed
class SignInButtonValidationState with _$SignInButtonValidationState {
  const factory SignInButtonValidationState.initial() = _Initial;
  const factory SignInButtonValidationState.disabled() = _Disabled;
  const factory SignInButtonValidationState.enabled() = _Enabled;
  
}

