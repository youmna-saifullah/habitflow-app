import 'route_names.dart';
import 'route_transitions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/habit/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/tracker/presentation/screens/tracker_screen.dart';
import '../../features/new_habit/presentation/screens/add_habit_screen.dart';

/// Central route resolver that maps route names to feature placeholders.
///
/// The router intentionally wires only navigation structure in Step 3. Feature
/// UI and business logic can later plug into these route entries.
final class AppRouter {
  /// Private constructor to avoid instantiation.
  const AppRouter._();

  /// Initial route used when the app starts.
  static const String initialRoute = RouteNames.SPLASH;

  /// Router config consumed by `MaterialApp.router` in `main.dart`.
  static final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    routes: <RouteBase>[
      GoRoute(
        path: RouteNames.SPLASH,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return RouteTransitions.fadePage<void>(
            key: state.pageKey,
            child: const SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteNames.HOME,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return RouteTransitions.slidePage<void>(
            key: state.pageKey,
            child: const HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteNames.NEW_HABIT,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return RouteTransitions.scalePage<void>(
            key: state.pageKey,
            child: const AddHabitScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteNames.TRACKER,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return RouteTransitions.slideFromBottomPage<void>(
            key: state.pageKey,
            child: const TrackerScreen(),
          );
        },
      ),
    ],
  );
}
