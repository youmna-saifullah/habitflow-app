import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/habit.dart';

/// Firestore DTO for habit persistence.
class HabitModel extends Habit {
  /// Creates a habit model.
  const HabitModel({
    required super.id,
    required super.title,
    required super.motivation,
    required super.colorHex,
    required super.targetDaysPerWeek,
    required super.completedToday,
    required super.createdAt,
  });

  /// Creates a model from Firestore document.
  factory HabitModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final Map<String, dynamic> data = doc.data() ?? <String, dynamic>{};
    return HabitModel(
      id: doc.id,
      title: (data['title'] as String?) ?? 'Untitled Habit',
      motivation: (data['motivation'] as String?) ?? '',
      colorHex: (data['colorHex'] as String?) ?? '#6C5CE7',
      targetDaysPerWeek: (data['targetDaysPerWeek'] as int?) ?? 4,
      completedToday: (data['completedToday'] as bool?) ?? false,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  /// Serializes this model to Firestore map.
  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'title': title,
      'motivation': motivation,
      'colorHex': colorHex,
      'targetDaysPerWeek': targetDaysPerWeek,
      'completedToday': completedToday,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
