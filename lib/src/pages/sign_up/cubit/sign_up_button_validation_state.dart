part of 'sign_up_button_validation_cubit.dart';

@freezed
class SignUpButtonValidationState with _$SignUpButtonValidationState {
  const factory SignUpButtonValidationState.initial() = _Initial;
  const factory SignUpButtonValidationState.disabled() = _Disabled;
  const factory SignUpButtonValidationState.enabled() = _Enabled;

}
