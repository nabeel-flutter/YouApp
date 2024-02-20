import 'package:freezed_annotation/freezed_annotation.dart';

part 'readings_status.freezed.dart';

@freezed
class ReadingsStatus with _$ReadingsStatus {
  const ReadingsStatus._();
  const factory ReadingsStatus.high() = _High;
  const factory ReadingsStatus.normal() = _Normal;
  const factory ReadingsStatus.low() = _Low;
}
