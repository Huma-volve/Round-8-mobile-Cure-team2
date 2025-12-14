import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

extension ThemeExt on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;
  AppBarThemeData get appBarTheme => Theme.of(this).appBarTheme;
  // TextTheme get textTheme => Theme.of(this).textTheme;

}


extension CustomColors on ColorScheme {
  Color get warning => brightness == Brightness.light
      ? AppColors.warning
      : AppColors.warning300;
  Color get onWarning => brightness == Brightness.light
      ? Colors.white
      : AppColors.warning900;
  Color get warningContainer => brightness == Brightness.light
      ? AppColors.warning100
      : AppColors.warning700;
  Color get onWarningContainer => brightness == Brightness.light
      ? AppColors.warning900
      : AppColors.warning100;
  Color get success => brightness == Brightness.light
      ? AppColors.success
      : AppColors.success300;
  Color get onSuccess => brightness == Brightness.light
      ? Colors.white
      : AppColors.success900;
  Color get successContainer => brightness == Brightness.light
      ? AppColors.success100
      : AppColors.success700;
  Color get onSuccessContainer => brightness == Brightness.light
      ? AppColors.success900
      : AppColors.success100;
  /// grey Scale
  Color get grey => AppColors.grey;
  Color get grey50 => AppColors.grey50;
  Color get grey100 => AppColors.grey100;
  Color get grey200 => AppColors.grey200;
  Color get grey300 => AppColors.grey300;
  Color get grey400 => AppColors.grey400;
  Color get grey600 => AppColors.grey600;
  Color get grey700 => AppColors.grey700;
  Color get grey800 => AppColors.grey800;
  Color get grey900 => AppColors.grey900;
}

extension Opacity on Color{
  Color withAppOpacity(double opacity){
    return withValues(alpha: opacity);
  }
}