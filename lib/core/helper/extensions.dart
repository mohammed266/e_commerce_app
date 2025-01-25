/// Extension on nullable String to check if it is null or empty.
extension EmptyStringExtension on String? {
  /// Returns `true` if the string is null or empty.
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// Extension on nullable String to check if it is neither null nor empty.
extension NonEmptyStringExtension on String? {
  /// Returns `true` if the string is not null and not empty.
  bool isNotNullOrEmpty() => this != null && this!.isNotEmpty;
}