import 'package:firebase_core/firebase_core.dart';

import '../core/services/habit_firestore_service.dart';
import '../features/habit/data/repositories/habit_repository_impl.dart';
import '../features/habit/domain/repositories/habit_repository.dart';
import '../firebase_options.dart';

/// Dependency initialization entry point for feature modules.
final class InjectionContainer {
  /// Private constructor to prevent external instantiation.
  const InjectionContainer._();

  static HabitRepository? _habitRepository;

  /// Shared habit repository used by providers.
  static HabitRepository get habitRepository {
    final HabitRepository? repository = _habitRepository;
    if (repository == null) {
      throw StateError(
        'InjectionContainer is not initialized. Call initialize() first.',
      );
    }
    return repository;
  }

  /// Initializes global dependencies before the app starts.
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final HabitFirestoreService firestoreService = HabitFirestoreService();
    _habitRepository = HabitRepositoryImpl(firestoreService);
  }
}
