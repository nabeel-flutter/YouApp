part of 'service_cubit.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState.initial() = _Initial;
  const factory ServiceState.loading() = _Loading;
  const factory ServiceState.loaded(List<ServiceModel> services) = _Loaded;
}
