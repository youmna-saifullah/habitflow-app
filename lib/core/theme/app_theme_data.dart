import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

/// Factory for creating light and dark `ThemeData` instances.
final class AppThemeData {
  /// Private constructor to avoid object creation.
  const AppThemeData._();

  /// Light mode `ThemeData` definition.
  static ThemeData light() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      error: AppColors.error,
      surface: AppColors.surface,
      onSurface: AppColors.lightOnBackground,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: colorScheme,
      textTheme: TextTheme(
        displayLarge: AppTextStyle.display,
        headlineLarge: AppTextStyle.headingLarge,
        headlineMedium: AppTextStyle.headingMedium,
        headlineSmall: AppTextStyle.headingSmall,
        bodyLarge: AppTextStyle.bodyRegular,
        bodyMedium: AppTextStyle.bodyRegular,
        titleMedium: AppTextStyle.bodyMedium,
        bodySmall: AppTextStyle.bodySmall,
        labelMedium: AppTextStyle.labelMedium,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightOnBackground,
        iconTheme: const IconThemeData(color: AppColors.primary),
        actionsIconTheme: const IconThemeData(color: AppColors.primary),
        titleTextStyle: AppTextStyle.headingSmall.copyWith(
          color: AppColors.lightOnBackground,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
      primaryIconTheme: const IconThemeData(color: AppColors.primary),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      dividerColor: AppColors.border,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.primary,
          iconColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          textStyle: AppTextStyle.bodyRegular,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          iconColor: AppColors.primary,
          textStyle: AppTextStyle.bodyRegular,
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        labelStyle: AppTextStyle.bodySmall.copyWith(color: AppColors.mutedText),
        hintStyle: AppTextStyle.bodySmall.copyWith(color: AppColors.mutedText),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }

  /// Dark mode `ThemeData` definition.
  static ThemeData dark() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.secondary,
      secondary: AppColors.accent,
      tertiary: AppColors.primary,
      error: AppColors.error,
      surface: const Color(0xFF17262C),
      onSurface: AppColors.darkOnBackground,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: colorScheme,
      textTheme: TextTheme(
        displayLarge: AppTextStyle.display.copyWith(
          color: AppColors.darkOnBackground,
        ),
        headlineLarge: AppTextStyle.headingLarge.copyWith(
          color: AppColors.darkOnBackground,
        ),
        headlineMedium: AppTextStyle.headingMedium.copyWith(
          color: AppColors.darkOnBackground,
        ),
        headlineSmall: AppTextStyle.headingSmall.copyWith(
          color: AppColors.darkOnBackground,
        ),
        bodyLarge: AppTextStyle.bodyRegular.copyWith(
          color: AppColors.darkOnBackground,
        ),
        bodyMedium: AppTextStyle.bodyRegular.copyWith(
          color: AppColors.darkOnBackground,
        ),
        bodySmall: AppTextStyle.bodySmall.copyWith(
          color: AppColors.darkOnBackground,
        ),
        titleMedium: AppTextStyle.bodyMedium.copyWith(
          color: AppColors.darkOnBackground,
        ),
        labelMedium: AppTextStyle.labelMedium.copyWith(
          color: AppColors.darkOnBackground,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkOnBackground,
        iconTheme: const IconThemeData(color: AppColors.primary),
        actionsIconTheme: const IconThemeData(color: AppColors.primary),
        titleTextStyle: AppTextStyle.headingSmall.copyWith(
          color: AppColors.darkOnBackground,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
      primaryIconTheme: const IconThemeData(color: AppColors.primary),
      cardTheme: CardThemeData(
        color: const Color(0xFF1A2B31),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
      ),
      dividerColor: AppColors.darkOnBackground.withValues(alpha: 0.2),
    );
  }
}
