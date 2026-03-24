import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';

/// Utilities for interacting with host system APIs.
final class SystemUtils {
  /// Private constructor to avoid instantiation.
  const SystemUtils._();

  /// Month labels used by date formatter helpers.
  static const List<String> _months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Weekday labels used by date formatter helpers.
  static const List<String> _weekdays = <String>[
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  /// Locks orientation to portrait up/down.
  static Future<void> lockToPortrait() async {
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Restores all supported device orientations.
  static Future<void> unlockOrientations() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  /// Formats a date as `yyyy-MM-dd` for storage and API payloads.
  static String formatIsoDate(DateTime date) {
    final String year = date.year.toString().padLeft(4, '0');
    final String month = date.month.toString().padLeft(2, '0');
    final String day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  /// Formats a date as `Mon, 16 Mar 2026` for user-facing labels.
  static String formatReadableDate(DateTime date) {
    final String weekday = _weekdays[date.weekday - 1];
    final String month = _months[date.month - 1];
    return '$weekday, ${date.day} $month ${date.year}';
  }

  /// Formats a `TimeOfDay` into `HH:mm` 24-hour text.
  static String formatTime24h(TimeOfDay time) {
    final String hour = time.hour.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Formats a `TimeOfDay` into `h:mm AM/PM` 12-hour text.
  static String formatTime12h(TimeOfDay time) {
    final int normalizedHour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final String minute = time.minute.toString().padLeft(2, '0');
    final String meridiem = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$normalizedHour:$minute $meridiem';
  }

  /// Displays a reusable snack bar that works as a simple toast alternative.
  static void showSnackBar(
    BuildContext context,
    String message, {
    Duration duration = AppConstants.defaultSnackBarDuration,
    Color? backgroundColor,
  }) {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration,
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  /// Alias for snack bar helper to support future toast-like call sites.
  static void showToast(
    BuildContext context,
    String message, {
    Duration duration = AppConstants.defaultSnackBarDuration,
  }) {
    showSnackBar(context, message, duration: duration);
  }
}
