/// String transformation helpers for display and validation.
extension StringExtensions on String {
  /// Returns true when the string has no visible characters.
  bool get isBlank => trim().isEmpty;

  /// Returns first-letter uppercase string for UI labels.
  String get capitalize {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
