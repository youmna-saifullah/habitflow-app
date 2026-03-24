import 'package:flutter/material.dart';
import '../../../../core/widgets/cards/app_habit_card.dart';

/// Reusable habit card widget for list and dashboard use cases.
class HabitCard extends StatelessWidget {
  /// Creates a habit card widget.
  const HabitCard({
    required this.title,
    required this.icon,
    required this.isCompleted,
    super.key,
  });

  /// Habit title shown to the user.
  final String title;

  /// Leading icon representing the habit.
  final IconData icon;

  /// Completion status placeholder value.
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return AppHabitCard(title: title, icon: icon, isCompleted: isCompleted);
  }
}
