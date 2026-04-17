/// Domain entity representing a user habit.
class Habit {
  /// Creates a habit entity.
  const Habit({
    required this.id,
    required this.title,
    required this.motivation,
    required this.colorHex,
    required this.targetDaysPerWeek,
    required this.completedToday,
    required this.createdAt,
  });

  /// Firestore document id.
  final String id;

  /// Habit title shown in lists.
  final String title;

  /// Optional motivation note.
  final String motivation;

  /// Color token in hex format.
  final String colorHex;

  /// Target completions each week.
  final int targetDaysPerWeek;

  /// Whether user marked this habit done today.
  final bool completedToday;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Returns a copy with updated fields.
  Habit copyWith({
    String? id,
    String? title,
    String? motivation,
    String? colorHex,
    int? targetDaysPerWeek,
    bool? completedToday,
    DateTime? createdAt,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      motivation: motivation ?? this.motivation,
      colorHex: colorHex ?? this.colorHex,
      targetDaysPerWeek: targetDaysPerWeek ?? this.targetDaysPerWeek,
      completedToday: completedToday ?? this.completedToday,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
