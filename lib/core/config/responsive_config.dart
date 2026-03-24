/// Breakpoints and layout limits shared across screens.
final class ResponsiveConfig {
  /// Private constructor to prevent accidental object creation.
  const ResponsiveConfig._();

  /// Mobile layout max width.
  static const double mobileMaxWidth = 599;

  /// Tablet layout max width.
  static const double tabletMaxWidth = 1023;

  /// Large desktop content max width.
  static const double desktopContentMaxWidth = 1200;

  /// Base design width used for scale utilities.
  static const double designWidth = 390;

  /// Base design height used for scale utilities.
  static const double designHeight = 844;
}
