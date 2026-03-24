import '../../theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Reusable centered loader widget for async placeholder states.
class AppLoader extends StatelessWidget {
  /// Creates a loader widget.
  const AppLoader({super.key, this.size = 24});

  /// Loader size in logical pixels.
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 2.2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
      ),
    );
  }
}
