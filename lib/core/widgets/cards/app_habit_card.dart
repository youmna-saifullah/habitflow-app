import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

/// Reusable habit card for home lists and summaries.
class AppHabitCard extends StatelessWidget {
  /// Creates a habit card.
  const AppHabitCard({
    required this.title,
    required this.icon,
    required this.isCompleted,
    super.key,
  });

  /// Habit title text.
  final String title;

  /// Habit icon representation.
  final IconData icon;

  /// Completion flag used to style status text.
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.mediumRadius),
      ),
      child: ListTile(
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(
          title,
          style: AppTextStyle.bodyMedium.copyWith(
            color: AppColors.lightOnBackground,
          ),
        ),
        subtitle: Text(
          isCompleted ? 'Completed today' : 'Pending today',
          style: AppTextStyle.labelMedium.copyWith(
            color: isCompleted ? AppColors.success : AppColors.mutedText,
          ),
        ),
        trailing: Checkbox(value: isCompleted, onChanged: null),
      ),
    );
  }
}
