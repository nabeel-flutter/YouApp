part of 'logs_cubit.dart';

@freezed
class LogsState with _$LogsState {
  const factory LogsState.initial() = _Initial;
  const factory LogsState.loaded(LogDetails logs) = _Loaded;
  const factory LogsState.loading() = _Loading;
  const factory LogsState.error(String message) = _Error;
}
