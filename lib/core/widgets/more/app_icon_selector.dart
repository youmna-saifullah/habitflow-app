import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

/// Reusable icon selector used by habit creation and editing flows.
class AppIconSelector extends StatelessWidget {
  /// Creates an app icon selector widget.
  const AppIconSelector({super.key});

  /// Placeholder options derived from feature requirements.
  static const List<_IconOption> _options = <_IconOption>[
    _IconOption(Icons.water_drop_rounded, 'Water', AppAssets.habitWater, true),
    _IconOption(
      Icons.fitness_center_rounded,
      'Workout',
      AppAssets.habitRun,
      false,
    ),
    _IconOption(Icons.menu_book_rounded, 'Read', AppAssets.habitRead, false),
    _IconOption(
      Icons.self_improvement_rounded,
      'Calm',
      AppAssets.habitMeditate,
      false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _options.map((option) {
        return Container(
          width: 74,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: option.selected
                ? AppColors.primary.withValues(alpha: 0.12)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: option.selected ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Column(
            children: <Widget>[
              Icon(option.iconData, color: AppColors.primary),
              const SizedBox(height: 6),
              Text(
                option.label,
                style: AppTextStyle.labelMedium.copyWith(
                  color: AppColors.lightOnBackground,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// Immutable icon option model for selector UI rendering.
class _IconOption {
  /// Creates an icon selector option.
  const _IconOption(this.iconData, this.label, this.assetPath, this.selected);

  /// Material icon shown in the tile.
  final IconData iconData;

  /// Display label for icon tile.
  final String label;

  /// Asset constant associated with icon tile.
  final String assetPath;

  /// Whether this tile is selected in placeholder UI.
  final bool selected;
}
