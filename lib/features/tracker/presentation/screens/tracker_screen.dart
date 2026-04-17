import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../habit/presentation/providers/habit_provider.dart';

/// Tracker screen that displays live progress insights.
class TrackerScreen extends StatelessWidget {
  /// Creates the tracker screen.
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<HabitProvider>(
          builder:
              (BuildContext context, HabitProvider provider, Widget? child) {
                final int total = provider.habits.length;
                final int done = provider.completedTodayCount;
                final double rate = provider.completionRate;

                return Padding(
                  padding: AppConstants.pagePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () => context.go(RouteNames.HOME),
                            icon: const Icon(Icons.arrow_back_rounded),
                          ),
                          Text('Tracker', style: AppTextStyle.headingSmall),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 170,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: CircularProgressIndicator(
                                      value: rate,
                                      strokeWidth: 14,
                                      backgroundColor: AppColors.primary
                                          .withValues(alpha: 0.14),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                            AppColors.accent,
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        '${(rate * 100).toStringAsFixed(0)}%',
                                        style: AppTextStyle.headingMedium
                                            .copyWith(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      Text(
                                        'completed',
                                        style: AppTextStyle.labelMedium
                                            .copyWith(
                                              color: AppColors.mutedText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            _MetricRow(
                              label: 'Habits completed today',
                              value: '$done',
                            ),
                            const SizedBox(height: 6),
                            _MetricRow(
                              label: 'Total active habits',
                              value: '$total',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text('Today overview', style: AppTextStyle.bodyMedium),
                      const SizedBox(height: 8),
                      Expanded(
                        child: provider.habits.isEmpty
                            ? Center(
                                child: Text(
                                  'Add habits to view tracking insights.',
                                  style: AppTextStyle.bodySmall.copyWith(
                                    color: AppColors.mutedText,
                                  ),
                                ),
                              )
                            : ListView.separated(
                                itemCount: provider.habits.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                      return const SizedBox(height: 10);
                                    },
                                itemBuilder: (BuildContext context, int index) {
                                  final habit = provider.habits[index];
                                  return Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.surface,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.border,
                                      ),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          habit.completedToday
                                              ? Icons.check_circle
                                              : Icons.circle_outlined,
                                          color: habit.completedToday
                                              ? AppColors.success
                                              : AppColors.mutedText,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            habit.title,
                                            style: AppTextStyle.bodyRegular,
                                          ),
                                        ),
                                        Text(
                                          '${habit.targetDaysPerWeek}d/week',
                                          style: AppTextStyle.labelMedium
                                              .copyWith(
                                                color: AppColors.mutedText,
                                              ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                );
              },
        ),
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            label,
            style: AppTextStyle.bodySmall.copyWith(color: AppColors.mutedText),
          ),
        ),
        Text(value, style: AppTextStyle.bodyRegular),
      ],
    );
  }
}
