/// Stateless validation helpers for forms and text fields.
final class Validators {
  /// Private constructor to avoid object creation.
  const Validators._();

  /// Email pattern used for optional/required email validation checks.
  static final RegExp _emailPattern = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );

  /// Number pattern used for decimal or integer input checks.
  static final RegExp _numberPattern = RegExp(r'^-?\d+(\.\d+)?$');

  /// Returns true when input is null or empty after trimming.
  static bool isBlank(String? value) {
    return value == null || value.trim().isEmpty;
  }

  /// Validates required text values.
  static String? requiredText(String? value, {String fieldName = 'Field'}) {
    if (isBlank(value)) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validates minimum text length for required input fields.
  static String? minLength(
    String? value,
    int min, {
    String fieldName = 'Field',
  }) {
    final String? requiredMessage = requiredText(value, fieldName: fieldName);
    if (requiredMessage != null) {
      return requiredMessage;
    }
    if (value!.trim().length < min) {
      return '$fieldName must be at least $min characters';
    }
    return null;
  }

  /// Validates maximum text length for optional or required fields.
  static String? maxLength(
    String? value,
    int max, {
    String fieldName = 'Field',
  }) {
    if (isBlank(value)) {
      return null;
    }
    if (value!.trim().length > max) {
      return '$fieldName must be at most $max characters';
    }
    return null;
  }

  /// Validates optional email input and allows blank values.
  static String? optionalEmail(String? value, {String fieldName = 'Email'}) {
    if (isBlank(value)) {
      return null;
    }
    if (!_emailPattern.hasMatch(value!.trim())) {
      return '$fieldName is not a valid email';
    }
    return null;
  }

  /// Validates required email input.
  static String? requiredEmail(String? value, {String fieldName = 'Email'}) {
    final String? requiredMessage = requiredText(value, fieldName: fieldName);
    if (requiredMessage != null) {
      return requiredMessage;
    }
    if (!_emailPattern.hasMatch(value!.trim())) {
      return '$fieldName is not a valid email';
    }
    return null;
  }

  /// Validates optional numeric input and allows blank values.
  static String? optionalNumber(String? value, {String fieldName = 'Value'}) {
    if (isBlank(value)) {
      return null;
    }
    if (!_numberPattern.hasMatch(value!.trim())) {
      return '$fieldName must be a valid number';
    }
    return null;
  }

  /// Validates positive integer inputs.
  static String? positiveNumber(String? value, {String fieldName = 'Value'}) {
    final String? requiredMessage = requiredText(value, fieldName: fieldName);
    if (requiredMessage != null) {
      return requiredMessage;
    }
    final int? parsedValue = int.tryParse(value!.trim());
    if (parsedValue == null || parsedValue <= 0) {
      return '$fieldName must be a positive number';
    }
    return null;
  }
}
