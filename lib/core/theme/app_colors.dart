import 'package:flutter/material.dart';

/// Brand and semantic colors shared by all themes.
final class AppColors {
  /// Private constructor to avoid object creation.
  const AppColors._();

  /// Primary brand color extracted from Figma.
  static const Color primary = Color(0xFF6C5CE7);

  /// Secondary accent color extracted from Figma.
  static const Color secondary = Color(0xFFE84393);

  /// Tertiary highlight color extracted from Figma.
  static const Color accent = Color(0xFF00CEC9);

  /// Warning color for attention states.
  static const Color warning = Color(0xFFFDCB6E);

  /// Success semantic color.
  static const Color success = Color(0xFF00B894);

  /// Error semantic color.
  static const Color error = Color(0xFFE34F4F);

  /// Main light background from Figma.
  static const Color lightBackground = Color(0xFFFAFAFA);

  /// Neutral surface used for cards and fields.
  static const Color surface = Color(0xFFFFFFFF);

  /// Subtle border/divider neutral tone.
  static const Color border = Color(0xFFDFE6E9);

  /// Secondary neutral text color.
  static const Color mutedText = Color(0xFF636E72);

  /// Dark surface background.
  static const Color darkBackground = Color(0xFF2D3436);

  /// Light theme primary text color.
  static const Color lightOnBackground = Color(0xFF2D3436);

  /// Dark text primary color.
  static const Color darkOnBackground = Color(0xFFE9F2F4);
}
