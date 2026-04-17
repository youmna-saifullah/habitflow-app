import 'package:cloud_firestore/cloud_firestore.dart';

/// Thin Firestore service wrapper used by habit repositories.
class HabitFirestoreService {
  /// Creates a firestore service.
  HabitFirestoreService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _habitsCollection =>
      _firestore.collection('habits');

  /// Stream habits ordered by creation date descending.
  Stream<QuerySnapshot<Map<String, dynamic>>> streamHabits() {
    return _habitsCollection.orderBy('createdAt', descending: true).snapshots();
  }

  /// Creates a new habit document.
  Future<void> createHabit(Map<String, dynamic> payload) async {
    await _habitsCollection.add(payload);
  }

  /// Updates an existing habit document.
  Future<void> updateHabit(String id, Map<String, dynamic> payload) async {
    await _habitsCollection.doc(id).update(payload);
  }
}
