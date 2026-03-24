import 'package:flutter/material.dart';

import 'app_theme_data.dart';

/// Public wrapper exposing app light and dark themes.
final class AppTheme {
  /// Private constructor to avoid object creation.
  const AppTheme._();

  /// Application light theme.
  static ThemeData get light => AppThemeData.light();

  /// Application dark theme.
  static ThemeData get dark => AppThemeData.dark();
}
