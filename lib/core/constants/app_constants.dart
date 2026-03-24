import 'package:flutter/widgets.dart';

/// Non-UI constants used across modules.
final class AppConstants {
  /// Private constructor to avoid accidental instances.
  const AppConstants._();

  /// Global app name used by reusable shells and metadata.
  static const String appName = 'Habit Tracker';

  /// Placeholder API base URL for future remote data integration.
  static const String apiBaseUrl = 'https://api.example.com';

  /// Placeholder API version path segment.
  static const String apiVersion = '/v1';

  /// Placeholder endpoint for habit resources.
  static const String habitsEndpoint = '$apiVersion/habits';

  /// Placeholder endpoint for tracker/progress resources.
  static const String trackerEndpoint = '$apiVersion/tracker';

  /// Default screen edge padding.
  static const double screenHorizontalPadding = 20;

  /// Default vertical spacing used in page sections.
  static const double sectionVerticalSpacing = 16;

  /// Default page-level content padding.
  static const EdgeInsets pagePadding = EdgeInsets.all(20);

  /// Standard medium corner radius.
  static const double mediumRadius = 16;

  /// Standard large corner radius.
  static const double largeRadius = 24;

  /// Common short animation duration.
  static const Duration shortAnimation = Duration(milliseconds: 220);

  /// Common medium animation duration.
  static const Duration mediumAnimation = Duration(milliseconds: 340);

  /// Common long animation duration.
  static const Duration longAnimation = Duration(milliseconds: 500);

  /// Default snack bar display duration.
  static const Duration defaultSnackBarDuration = Duration(seconds: 2);
}
