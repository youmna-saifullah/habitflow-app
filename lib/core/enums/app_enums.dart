/// Theme modes supported by the app domain.
enum AppThemeMode {
  /// Always use light appearance.
  light,

  /// Always use dark appearance.
  dark,

  /// Follow the system appearance.
  system,
}

/// Habit categorization types reusable across all feature modules.
enum HabitType {
  /// Health-focused habits (hydration, exercise, sleep).
  health,

  /// Productivity-focused habits (planning, work blocks, routines).
  productivity,

  /// Learning-focused habits (reading, courses, practice).
  learning,

  /// Mindfulness-focused habits (meditation, reflection, gratitude).
  mindfulness,

  /// Lifestyle-focused habits (cleaning, budgeting, chores).
  lifestyle,
}

/// Habit urgency levels for future prioritization UI.
enum HabitPriority {
  /// Lowest urgency.
  low,

  /// Medium urgency.
  medium,

  /// Highest urgency.
  high,
}

/// Tracker completion states reusable in tracker timelines and analytics.
enum TrackerStatus {
  /// Habit instance is planned but not started yet.
  pending,

  /// Habit instance is in progress.
  inProgress,

  /// Habit instance is completed successfully.
  completed,

  /// Habit instance was skipped intentionally.
  skipped,

  /// Habit instance was missed unintentionally.
  missed,
}
