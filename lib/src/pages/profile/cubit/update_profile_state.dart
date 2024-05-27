part of 'update_profile_cubit.dart';

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.initial() = _Initial;
    const factory UpdateProfileState.loading() = _loading;
  const factory UpdateProfileState.loaded(GetProfileDto profile) = _Loaded;
  const factory UpdateProfileState.error(String massange) = _Error;

}
