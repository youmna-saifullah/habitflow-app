import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized text styles powered by Google Fonts.
final class AppTextStyle {
  /// Private constructor to avoid object creation.
  const AppTextStyle._();

  /// Display heading style from Figma hero sections.
  static TextStyle get display => GoogleFonts.bitter(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.15,
  );

  /// Large heading used in top-level screens.
  static TextStyle get headingLarge => GoogleFonts.bitter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// Medium heading used in section titles.
  static TextStyle get headingMedium => GoogleFonts.bitter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  /// Small heading used in cards and dialog headers.
  static TextStyle get headingSmall => GoogleFonts.bitter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  /// Body text for normal paragraphs.
  static TextStyle get bodyRegular => GoogleFonts.bitter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  /// Body text with stronger emphasis.
  static TextStyle get bodyMedium => GoogleFonts.bitter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  /// Compact body style for helper labels.
  static TextStyle get bodySmall => GoogleFonts.bitter(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.35,
  );

  /// Label text for chips, buttons, and compact controls.
  static TextStyle get labelMedium => GoogleFonts.bitter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
}
