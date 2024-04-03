abstract class LogState {}

class DataInitial extends LogState {}

class DataLoading extends LogState {}

class DataLoaded extends LogState {
  final List<dynamic> data;
  DataLoaded(this.data);
}

class DataError extends LogState {
  final String message;
  DataError(this.message);
}
