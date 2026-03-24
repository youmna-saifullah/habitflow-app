import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/snackbars/app_snackbar.dart';

/// Screen that hosts reusable add-habit form UI placeholders.
class AddHabitScreen extends StatelessWidget {
  /// Creates an add-habit screen.
  const AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F5),
      body: SafeArea(
        child: Padding(
          padding: AppConstants.pagePadding,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => context.go(RouteNames.HOME),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  Expanded(
                    child: Text(
                      'New Habit',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.headingSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _HabitFieldRow(hint: 'Habit Name'),
              const SizedBox(height: 12),
              const _HabitFieldRow(
                hint: 'Frequency',
                value: 'Weekly',
                trailingIcon: Icons.keyboard_arrow_down_rounded,
              ),
              const SizedBox(height: 12),
              _HabitFieldRow(
                hint: 'Color',
                trailing: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _HabitFieldRow(hint: 'Motivation'),
              const SizedBox(height: 12),
              const _HabitFieldRow(
                hint: 'Alarm',
                trailingIcon: Icons.alarm_rounded,
                trailingIconColor: Color(0xFFCFD8DC),
              ),
              const SizedBox(height: 12),
              const _HabitFieldRow(
                hint: 'Priority',
                value: 'High',
                trailingIcon: Icons.keyboard_arrow_down_rounded,
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () {
                  AppSnackbar.show(
                    context,
                    'Habit draft saved (UI placeholder)',
                  );
                  context.go(RouteNames.HOME);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                ),
                icon: const Icon(Icons.add, size: 20),
                label: Text(
                  'Save Habit',
                  style: AppTextStyle.bodyRegular.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Reusable single-line form row for the static New Habit layout.
class _HabitFieldRow extends StatelessWidget {
  /// Creates a field row.
  const _HabitFieldRow({
    required this.hint,
    this.value,
    this.trailing,
    this.trailingIcon,
    this.trailingIconColor,
  });

  /// Left hint label.
  final String hint;

  /// Optional right value text.
  final String? value;

  /// Optional right trailing widget.
  final Widget? trailing;

  /// Optional right trailing icon.
  final IconData? trailingIcon;

  /// Optional icon color override.
  final Color? trailingIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              hint,
              style: AppTextStyle.bodyRegular.copyWith(
                color: AppColors.mutedText.withValues(alpha: 0.75),
              ),
            ),
          ),
          if (value case final selectedValue?)
            Text(
              selectedValue,
              style: AppTextStyle.bodyRegular.copyWith(
                color: AppColors.lightOnBackground,
              ),
            ),
          if (value != null && trailingIcon != null) const SizedBox(width: 6),
          if (trailing case final Widget trailingWidget) trailingWidget,
          if (trailingIcon case final IconData iconData)
            Icon(iconData, color: trailingIconColor ?? const Color(0xFFCFD8DC)),
        ],
      ),
    );
  }
}
