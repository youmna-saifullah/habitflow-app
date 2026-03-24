import 'package:flutter/material.dart';

/// App-wide theme state holder used by the root widget.
///
/// This provider is intentionally lightweight for now and can later be consumed
/// with `Provider`, `ChangeNotifierProvider`, and `Consumer` widgets in feature
/// presentation layers.
class ThemeProvider extends ChangeNotifier {
  /// Currently selected theme mode.
  ThemeMode _themeMode = ThemeMode.system;

  /// Returns active theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Updates theme mode and notifies listeners.
  ///
  /// UI screens can call this through provider context once the app wires
  /// feature-level controls.
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  /// Toggles between light and dark modes.
  ///
  /// This is a placeholder toggle ready for future settings/profile UI.
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }
}
