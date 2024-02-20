extension ScopeFunctionsError<R> on R? {
  R throwOnNull(String errorMessage) {
    final result = this;
    if (result == null) {
      throw Exception(errorMessage);
    } else {
      return result;
    }
  }
}

extension ScopeFunctionsEmptyError<R> on R? {
  R throwOnNullOrEmpty(String errorMessage) {
    final result = this;
    if (result == null || result == "") {
      throw Exception(errorMessage);
    } else {
      return result;
    }
  }
}

extension ScopeFunctions<R> on R {
  T let<T>(TypedFunction<R, T> func) {
    return func(this);
  }
}

void safeLet<T, P>(T? param1, P? param2, TwoTypedFunction<T, P> block) {
  if (param1 != null && param2 != null) {
    block(param1, param2);
  } else {
    return;
  }
}

typedef TypedFunction<R, T> = T Function(R);

typedef TwoTypedFunction<T, P> = Function(T, P);
