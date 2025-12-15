import 'package:cure_team_2/core/extensions/style.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  /// Light Theme Data
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _ColorScheme.lightColorScheme,
  );

  /// Dark Theme Data
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _ColorScheme.darkColorScheme,
  );
}

class _ColorScheme {
  const _ColorScheme._();

  /// Light Color Scheme
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: AppColors.primary100,
    onPrimaryContainer: AppColors.primary900,

    // Secondary Colors
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    secondaryContainer: AppColors.secondary100,
    onSecondaryContainer: AppColors.secondary900,

    // Tertiary Colors (using info as tertiary)
    tertiary: AppColors.info,
    onTertiary: Colors.white,
    tertiaryContainer: AppColors.info100,
    onTertiaryContainer: AppColors.info900,

    // Error Colors
    error: AppColors.error,
    onError: Colors.white,
    errorContainer: AppColors.error100,
    onErrorContainer: AppColors.error900,

    // Background Colors
    surface: Colors.white,
    onSurface: AppColors.secondary,
    surfaceContainerHighest: AppColors.grey50,

    // Outline Colors
    outline: AppColors.grey300,
    outlineVariant: AppColors.grey200,

    // Shadow & Scrim
    shadow: AppColors.grey900.withAppOpacity(0.15),
    scrim: AppColors.secondary900.withAppOpacity(0.5),

    inverseSurface: AppColors.secondary800,
    onInverseSurface: AppColors.grey50,
    inversePrimary: AppColors.primary200,
  );

  /// Dark Color Scheme
  static ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    // Primary Colors
    primary: AppColors.primary300,
    onPrimary: AppColors.primary900,
    primaryContainer: AppColors.primary700,
    onPrimaryContainer: AppColors.primary100,

    // Secondary Colors
    secondary: AppColors.secondary200,
    onSecondary: AppColors.secondary900,
    secondaryContainer: AppColors.secondary700,
    onSecondaryContainer: AppColors.secondary100,

    // Tertiary Colors (using info as tertiary)
    tertiary: AppColors.info300,
    onTertiary: AppColors.info900,
    tertiaryContainer: AppColors.info700,
    onTertiaryContainer: AppColors.info100,

    // Error Colors
    error: AppColors.error300,
    onError: AppColors.error900,
    errorContainer: AppColors.error700,
    onErrorContainer: AppColors.error100,

    // Background Colors
    surface: AppColors.secondary900,
    onSurface: AppColors.grey100,
    surfaceContainerHighest: AppColors.secondary800,

    // Outline Colors
    outline: AppColors.grey600,
    outlineVariant: AppColors.grey700,

    // Shadow & Scrim
    shadow: Colors.black.withAppOpacity(0.3),
    scrim: Colors.black.withAppOpacity(0.7),

    // Inverse Colors
    inverseSurface: AppColors.grey100,
    onInverseSurface: AppColors.secondary800,
    inversePrimary: AppColors.primary600,
  );
}
