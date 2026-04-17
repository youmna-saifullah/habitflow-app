import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/entities/habit.dart';
import '../../domain/repositories/habit_repository.dart';

/// Presentation provider for reading and mutating habits.
class HabitProvider extends ChangeNotifier {
  /// Creates habit provider.
  HabitProvider(this._repository);

  final HabitRepository _repository;
  StreamSubscription<List<Habit>>? _habitsSubscription;

  List<Habit> _habits = <Habit>[];
  bool _isLoading = true;
  String? _error;

  /// Current habits sorted by recent creation date.
  List<Habit> get habits => _habits;

  /// Loading state while initial stream emits.
  bool get isLoading => _isLoading;

  /// Optional error text for UI.
  String? get error => _error;

  /// Count of habits completed today.
  int get completedTodayCount =>
      _habits.where((Habit habit) => habit.completedToday).length;

  /// Overall completion ratio.
  double get completionRate {
    if (_habits.isEmpty) {
      return 0;
    }
    return completedTodayCount / _habits.length;
  }

  /// Begins listening for habit updates.
  void watchHabits() {
    _habitsSubscription?.cancel();
    _isLoading = true;
    _error = null;
    notifyListeners();

    _habitsSubscription = _repository.watchHabits().listen(
      (List<Habit> items) {
        _habits = items;
        _isLoading = false;
        _error = null;
        notifyListeners();
      },
      onError: (Object e) {
        _isLoading = false;
        _error = 'Unable to load habits. Please try again.';
        notifyListeners();
      },
    );
  }

  /// Adds a habit then relies on stream refresh.
  Future<void> addHabit({
    required String title,
    required String motivation,
    required String colorHex,
    required int targetDaysPerWeek,
  }) async {
    await _repository.addHabit(
      title: title,
      motivation: motivation,
      colorHex: colorHex,
      targetDaysPerWeek: targetDaysPerWeek,
    );
  }

  /// Toggles a habit completion state.
  Future<void> toggleHabitCompletion(Habit habit) async {
    await _repository.toggleHabitCompletion(
      id: habit.id,
      completedToday: !habit.completedToday,
    );
  }

  @override
  void dispose() {
    _habitsSubscription?.cancel();
    super.dispose();
  }
}
