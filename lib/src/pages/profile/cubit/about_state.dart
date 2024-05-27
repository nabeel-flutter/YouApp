part of 'about_cubit.dart';

@freezed
class AboutState with _$AboutState {
  const factory AboutState.initial() = _Initial;
  const factory AboutState.editable() = _Editable;
  const factory AboutState.view() = _View;
}
