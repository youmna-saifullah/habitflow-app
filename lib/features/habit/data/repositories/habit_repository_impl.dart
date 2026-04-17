import '../../../../core/services/habit_firestore_service.dart';
import '../../domain/entities/habit.dart';
import '../../domain/repositories/habit_repository.dart';
import '../models/habit_model.dart';

/// Firestore-backed implementation of the habit repository.
class HabitRepositoryImpl implements HabitRepository {
  /// Creates repository implementation.
  HabitRepositoryImpl(this._firestoreService);

  final HabitFirestoreService _firestoreService;

  @override
  Stream<List<Habit>> watchHabits() {
    return _firestoreService.streamHabits().map((snapshot) {
      return snapshot.docs.map(HabitModel.fromFirestore).toList();
    });
  }

  @override
  Future<void> addHabit({
    required String title,
    required String motivation,
    required String colorHex,
    required int targetDaysPerWeek,
  }) async {
    final HabitModel model = HabitModel(
      id: '',
      title: title,
      motivation: motivation,
      colorHex: colorHex,
      targetDaysPerWeek: targetDaysPerWeek,
      completedToday: false,
      createdAt: DateTime.now(),
    );

    await _firestoreService.createHabit(model.toFirestore());
  }

  @override
  Future<void> toggleHabitCompletion({
    required String id,
    required bool completedToday,
  }) async {
    await _firestoreService.updateHabit(id, <String, dynamic>{
      'completedToday': completedToday,
    });
  }
}
