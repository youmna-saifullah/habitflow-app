/// Centralized asset paths used by reusable widgets and features.
final class AppAssets {
  /// Private constructor to avoid instantiation.
  const AppAssets._();

  /// Root images folder.
  static const String images = 'assets/images';

  /// Root icons folder.
  static const String icons = 'assets/images/icons';

  /// Root habit icons folder.
  static const String habitIcons = 'assets/images/icons/habits';

  /// Root logos folder.
  static const String logos = 'assets/images/logos';

  /// Root generic illustrations folder for future onboarding/empty states.
  static const String illustrations = 'assets/images/illustrations';

  /// Main app logo.
  static const String appLogo = '$logos/app-logo.svg';

  /// Adaptive app icon artwork.
  static const String appIcon = '$icons/app_icon.svg';

  /// Optional raster logo path for platform-specific usage in the future.
  static const String appLogoPng = '$logos/app_logo.png';

  /// Optional raster app icon path for future launcher generation flows.
  static const String appIconPng = '$icons/app_icon.png';

  /// Placeholder icon for hydration habit.
  static const String habitWater = '$habitIcons/habit_water.svg';

  /// Placeholder icon for running habit.
  static const String habitRun = '$habitIcons/habit_run.svg';

  /// Placeholder icon for reading habit.
  static const String habitRead = '$habitIcons/habit_read.svg';

  /// Placeholder icon for meditation habit.
  static const String habitMeditate = '$habitIcons/habit_meditate.svg';

  /// Ordered list of placeholder habit icons for reusable pickers/grids.
  static const List<String> habitIconSet = <String>[
    habitWater,
    habitRun,
    habitRead,
    habitMeditate,
  ];
}
