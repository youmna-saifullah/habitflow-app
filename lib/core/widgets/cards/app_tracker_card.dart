import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

/// Reusable tracker progress card with circular chart visualization.
class AppTrackerCard extends StatelessWidget {
  /// Creates a tracker card.
  const AppTrackerCard({required this.percentage, super.key});

  /// Progress percentage value between 0 and 1.
  final double percentage;

  @override
  Widget build(BuildContext context) {
    final double value = percentage.clamp(0, 1);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 168,
            height: 168,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CircularProgressIndicator(
                  value: value,
                  strokeWidth: 14,
                  backgroundColor: AppColors.secondary.withValues(alpha: 0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                ),
                Center(
                  child: Text(
                    '${(value * 100).toStringAsFixed(0)}%',
                    style: AppTextStyle.headingSmall.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Weekly Completion',
            style: AppTextStyle.bodyMedium.copyWith(
              color: AppColors.lightOnBackground,
            ),
          ),
        ],
      ),
    );
  }
}
