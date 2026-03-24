import 'app/app_name.dart';
import 'app/injection_container.dart';
import 'package:flutter/material.dart';

/// Application entry point.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.initialize();
  runApp(const HabitTrackerApp());
}
