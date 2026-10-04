import 'package:flutter/material.dart';

import './app_colors.dart';
import './app_text_styles.dart';

class AppTheme._() {
  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.accent,
    surface: AppColors.surface,
    error: AppColors.error,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.dark,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.accent,
    surface: AppColors.surfaceVariant,
    error: AppColors.error,
  );

  static ThemeData get lightTheme => ThemeData(
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      titleTextStyle: AppTextStyles.headingMd.copyWith(color: AppColors.white),
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headingLg.copyWith(color: AppColors.text),
      headlineMedium: AppTextStyles.headingMd.copyWith(color: AppColors.text),

      titleLarge: AppTextStyles.headingSm.copyWith(color: AppColors.text),
      titleMedium: AppTextStyles.headingXs.copyWith(color: AppColors.text),

      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.textSecondary),
      bodyMedium: AppTextStyles.bodyMd.copyWith(color: AppColors.textTertiary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.error),
      ),
      labelStyle: AppTextStyles.label.copyWith(
        color: AppColors.primary.withValues(alpha: 0.8),
      ),
      hintStyle: AppTextStyles.bodyLg.copyWith(color: AppColors.textTertiary),
      iconColor: AppColors.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 3,
        shadowColor: AppColors.primary.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        textStyle: AppTextStyles.bodyLgSemibold,
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: AppColors.backgroundVariant,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      titleTextStyle: AppTextStyles.headingMd.copyWith(color: AppColors.white),
      iconTheme: IconThemeData(color: AppColors.white),
    ),
  );
}
