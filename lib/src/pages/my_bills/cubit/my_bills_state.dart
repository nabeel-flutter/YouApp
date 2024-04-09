part of 'my_bills_cubit.dart';

@freezed
class MyBillsState with _$MyBillsState {
  const factory MyBillsState.initial() = _Initial;

  const factory MyBillsState.loading() = _Loading;

  const factory MyBillsState.error(String message) = _Error;

  const factory MyBillsState.loaded(TokenDto token) = _Loaded;
}
