import 'package:equatable/equatable.dart';

class Error extends Equatable {
  final int code;
  final String message;

  const Error({
    this.code = kUnknown,
    required this.message,
  });

  const Error.message(this.message, {this.code = kUnknown});

  @override
  List<Object?> get props => [code, message];

  ///
  /// Indicates that the error is unknown
  ///
  static const int kUnknown = -1;
}
