import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_colors.dart';

/// Reusable snackbar helper for consistent app feedback messages.
final class AppSnackbar {
  /// Private constructor to prevent instantiation.
  const AppSnackbar._();

  /// Shows a simple message snackbar.
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: AppConstants.defaultSnackBarDuration,
          backgroundColor: AppColors.lightOnBackground,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
