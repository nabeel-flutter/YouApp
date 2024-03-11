part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = _Initial;
  const factory UserProfileState.loaded(UserModel user) = _Loaded;
  const factory UserProfileState.loading() = _Loading;
  const factory UserProfileState.error(String message) = _Error;
}
