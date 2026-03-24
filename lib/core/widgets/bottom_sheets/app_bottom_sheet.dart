import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Reusable bottom sheet launcher for future feature dialogs.
final class AppBottomSheet {
  /// Private constructor to prevent instantiation.
  const AppBottomSheet._();

  /// Shows a themed bottom sheet with provided child content.
  static Future<T?> show<T>(BuildContext context, Widget child) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(child: child);
      },
    );
  }
}
