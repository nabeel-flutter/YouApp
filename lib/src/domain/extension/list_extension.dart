extension ListNotNull<T> on List<dynamic>? {
  // ignore: avoid_shadowing_type_parameters
  List<T> toNotNullList<T>(T? Function(dynamic e) eval) {
    final List<T> elements = [];

    this?.forEach((element) {
      try {
        final T? result = eval(element);
        if (result != null) {
          elements.add(result);
        }
      } catch (e) {
        // in case if inner exception inside "eval" ignore it
      }
    });

    return elements;
  }
}
