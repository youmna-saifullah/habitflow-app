import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/buttons/app_secondary_button.dart';

/// Home screen showing a static list of habits.
class HomeScreen extends StatelessWidget {
  /// Creates the home habit screen.
  const HomeScreen({super.key});

  /// Habit entries with static weekly progress indicators.
  static const List<_HabitRowData> _habitRows = <_HabitRowData>[
    _HabitRowData(
      title: 'Drink Water',
      stripColor: AppColors.primary,
      dots: <Color?>[
        AppColors.primary,
        AppColors.primary,
        null,
        null,
        null,
        null,
        null,
      ],
    ),
    _HabitRowData(
      title: 'Shower',
      stripColor: AppColors.accent,
      dots: <Color?>[
        AppColors.accent,
        null,
        AppColors.accent,
        AppColors.accent,
        null,
        null,
        null,
      ],
    ),
    _HabitRowData(
      title: 'Read a Book',
      stripColor: AppColors.error,
      subtitle: 'You need to read every single day!',
      isExpanded: true,
      dots: <Color?>[
        AppColors.error,
        AppColors.error,
        AppColors.error,
        AppColors.error,
        null,
        null,
        null,
      ],
    ),
    _HabitRowData(
      title: 'Study Math',
      stripColor: AppColors.secondary,
      dots: <Color?>[
        AppColors.secondary,
        null,
        null,
        AppColors.secondary,
        AppColors.secondary,
        null,
        null,
      ],
    ),
  ];

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
                  const SizedBox(width: 48, height: 48),
                  Expanded(
                    child: Text(
                      'Habits',
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
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    for (final _HabitRowData item in _habitRows) ...<Widget>[
                      _HabitProgressRow(item: item),
                      const SizedBox(height: 10),
                    ],
                    const SizedBox(height: 26),
                    const _NextTaskCard(),
                    const SizedBox(height: 18),
                    AppSecondaryButton(
                      label: 'Open Tracker',
                      icon: Icons.stacked_bar_chart_rounded,
                      onPressed: () => context.push(RouteNames.TRACKER),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: AppColors.border.withValues(alpha: 0.45),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Another habit?',
                        style: AppTextStyle.bodyRegular.copyWith(
                          color: AppColors.mutedText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 46,
                    height: 46,
                    child: FloatingActionButton(
                      elevation: 0,
                      onPressed: () => context.push(RouteNames.NEW_HABIT),
                      child: const Icon(Icons.add_rounded),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Immutable habit row data for static UI rendering.
class _HabitRowData {
  /// Creates a static habit row.
  const _HabitRowData({
    required this.title,
    required this.stripColor,
    required this.dots,
    this.subtitle,
    this.isExpanded = false,
  });

  /// Habit title text.
  final String title;

  /// Left strip color.
  final Color stripColor;

  /// Optional supporting subtitle.
  final String? subtitle;

  /// Whether row shows expanded done state area.
  final bool isExpanded;

  /// Weekly progress dots where null means empty dot.
  final List<Color?> dots;
}

/// Figma-like habit row with strip and right-side weekly progress dots.
class _HabitProgressRow extends StatelessWidget {
  /// Creates a habit row.
  const _HabitProgressRow({required this.item});

  /// Data for a single row.
  final _HabitRowData item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: <Widget>[
          IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Container(
                  width: 3,
                  decoration: BoxDecoration(
                    color: item.stripColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                item.title,
                                style: AppTextStyle.bodyRegular.copyWith(
                                  color: AppColors.lightOnBackground,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            _ProgressDots(dots: item.dots),
                          ],
                        ),
                        if (item.subtitle != null) ...<Widget>[
                          const SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  item.subtitle!,
                                  style: AppTextStyle.bodySmall.copyWith(
                                    color: AppColors.mutedText,
                                  ),
                                ),
                              ),
                              const Icon(Icons.settings_outlined, size: 16),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (item.isExpanded)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.border.withValues(alpha: 0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                'Done!',
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyRegular.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Compact dot row showing seven-day completion markers.
class _ProgressDots extends StatelessWidget {
  /// Creates progress dots widget.
  const _ProgressDots({required this.dots});

  /// Dot color list where null means outline-only marker.
  final List<Color?> dots;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: dots.map((Color? color) {
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: color ?? AppColors.lightOnBackground,
              width: 1,
            ),
          ),
        );
      }).toList(),
    );
  }
}

/// Next-task panel matching the lower highlighted card in design.
class _NextTaskCard extends StatelessWidget {
  /// Creates next-task card.
  const _NextTaskCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Next Task',
                  style: AppTextStyle.bodyRegular.copyWith(
                    color: AppColors.mutedText,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Shower',
                  style: AppTextStyle.headingMedium.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '4PM',
                style: AppTextStyle.bodyRegular.copyWith(
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '3/5 this week',
                style: AppTextStyle.labelMedium.copyWith(
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
