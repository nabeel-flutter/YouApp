extension StringCasingExtension on String {
  ///
  /// Capitalize only the first word
  ///
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  ///
  /// Capitalize all words
  ///
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
