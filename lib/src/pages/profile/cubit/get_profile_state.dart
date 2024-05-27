part of 'get_profile_cubit.dart';

@freezed
class GetProfileState with _$GetProfileState {
  const factory GetProfileState.initial() = _Initial;
  const factory GetProfileState.loading() = _loading;
  const factory GetProfileState.loaded(GetProfileDto profile) = _Loaded;
  const factory GetProfileState.error(String massange) = _Error;
}
