import 'package:flutter/material.dart';

import './app_colors.dart';

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
  );

  static ThemeData get darkTheme => ThemeData(
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: AppColors.backgroundVariant,
  );
}
