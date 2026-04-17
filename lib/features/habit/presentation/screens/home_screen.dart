import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/buttons/app_primary_button.dart';
import '../../domain/entities/habit.dart';
import '../providers/habit_provider.dart';

/// Home screen showing all persisted habits.
class HomeScreen extends StatelessWidget {
  /// Creates the home habit screen.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(RouteNames.NEW_HABIT),
        label: const Text('New Habit'),
        icon: const Icon(Icons.add_rounded),
      ),
      body: SafeArea(
        child: Consumer<HabitProvider>(
          builder: (BuildContext context, HabitProvider provider, Widget? child) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppConstants.pagePadding,
                    child: _HomeHeader(provider: provider),
                  ),
                ),
                if (provider.isLoading)
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (provider.error != null)
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        provider.error!,
                        style: AppTextStyle.bodyRegular.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                    ),
                  )
                else if (provider.habits.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Padding(
                        padding: AppConstants.pagePadding,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Icon(
                              Icons.track_changes_rounded,
                              size: 56,
                              color: AppColors.primary,
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'No habits yet',
                              style: AppTextStyle.headingSmall,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Create your first habit to start building daily momentum.',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColors.mutedText,
                              ),
                            ),
                            const SizedBox(height: 16),
                            AppPrimaryButton(
                              label: 'Create Habit',
                              icon: Icons.add_circle_outline_rounded,
                              onPressed: () =>
                                  context.push(RouteNames.NEW_HABIT),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: AppConstants.pagePadding.copyWith(top: 0),
                    sliver: SliverList.separated(
                      itemBuilder: (BuildContext context, int index) {
                        final Habit habit = provider.habits[index];
                        return _HabitTile(
                          habit: habit,
                          onToggle: () => provider.toggleHabitCompletion(habit),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 12);
                      },
                      itemCount: provider.habits.length,
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 88)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.provider});

  final HabitProvider provider;

  @override
  Widget build(BuildContext context) {
    final int total = provider.habits.length;
    final int done = provider.completedTodayCount;
    final String percent =
        '${(provider.completionRate * 100).toStringAsFixed(0)}%';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF0B3C6E), Color(0xFF0F766E)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Today',
                style: AppTextStyle.headingMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => context.push(RouteNames.TRACKER),
                icon: const Icon(
                  Icons.analytics_outlined,
                  size: 18,
                  color: Colors.white,
                ),
                label: Text(
                  'Tracker',
                  style: AppTextStyle.labelMedium.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '$done of $total habits complete',
            style: AppTextStyle.bodyRegular.copyWith(
              color: Colors.white.withValues(alpha: 0.92),
            ),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: provider.completionRate,
            minHeight: 9,
            borderRadius: BorderRadius.circular(99),
            backgroundColor: Colors.white.withValues(alpha: 0.22),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFF97316)),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              percent,
              style: AppTextStyle.labelMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HabitTile extends StatelessWidget {
  const _HabitTile({required this.habit, required this.onToggle});

  final Habit habit;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final Color accent = _hexToColor(habit.colorHex);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 12,
            height: 56,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  habit.title,
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: AppColors.lightOnBackground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  habit.motivation.isEmpty
                      ? '${habit.targetDaysPerWeek} days / week goal'
                      : habit.motivation,
                  style: AppTextStyle.bodySmall.copyWith(
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          Switch(value: habit.completedToday, onChanged: (_) => onToggle()),
        ],
      ),
    );
  }
}

Color _hexToColor(String hex) {
  final String sanitized = hex.replaceAll('#', '');
  final String normalized = sanitized.length == 6 ? 'FF$sanitized' : sanitized;
  return Color(int.parse(normalized, radix: 16));
}
