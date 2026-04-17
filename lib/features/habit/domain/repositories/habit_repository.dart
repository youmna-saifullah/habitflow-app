import '../entities/habit.dart';

/// Contract for habit data operations.
abstract class HabitRepository {
  /// Streams all habits.
  Stream<List<Habit>> watchHabits();

  /// Adds a new habit.
  Future<void> addHabit({
    required String title,
    required String motivation,
    required String colorHex,
    required int targetDaysPerWeek,
  });

  /// Toggles the completion state for today.
  Future<void> toggleHabitCompletion({
    required String id,
    required bool completedToday,
  });
}
