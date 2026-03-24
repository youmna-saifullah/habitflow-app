import 'package:flutter/material.dart';

/// Convenience context getters for common Flutter objects.
extension ContextExtensions on BuildContext {
  /// Returns active theme data.
  ThemeData get theme => Theme.of(this);

  /// Returns active color scheme.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Returns active text theme.
  TextTheme get textTheme => theme.textTheme;

  /// Returns current media query data.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns current screen size.
  Size get screenSize => mediaQuery.size;
}
