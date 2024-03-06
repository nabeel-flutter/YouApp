part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
    const factory SignUpState.initial() = _Initial;

  const factory SignUpState.loading() = _Loading;

  const factory SignUpState.error(String message) = _Error;

  const factory SignUpState.loaded(TokenDto token) = _Loaded;

}
