import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker_app/core/theme/app_theme.dart';
import 'package:habit_tracker_app/core/router/app_router.dart';
import 'package:habit_tracker_app/core/providers/theme_provider.dart';

/// Application display name.
const String kAppName = 'Habit Tracker';

/// Root widget that wires dependency providers, routing, and theming.
class HabitTrackerApp extends StatelessWidget {
  /// Creates the root app widget.
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Global providers are registered here to keep feature modules independent.
    return ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
      // Consumer listens to theme changes and rebuilds MaterialApp accordingly.
      child: Consumer<ThemeProvider>(
        builder:
            (BuildContext context, ThemeProvider themeProvider, Widget? child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: kAppName,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeProvider.themeMode,
                // Router config centralizes all feature routes and transitions.
                routerConfig: AppRouter.router,
              );
            },
      ),
    );
  }
}
