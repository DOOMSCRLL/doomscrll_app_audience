import "package:flutter/material.dart";

import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/theme/app_typography.dart";
import "package:doomscrll_app_audience/theme/components/app_bar_theme.dart";
import "package:doomscrll_app_audience/theme/components/button_theme.dart";
import "package:doomscrll_app_audience/theme/components/input_theme.dart";

abstract final class AppTheme {
  static ThemeData get darkTheme {
    const colorScheme = ColorScheme.dark(
      surface: AppColors.darkness,
      onSurface: AppColors.lagoon,
      primary: AppColors.lagoon,
      onPrimary: AppColors.darkness,
      secondary: AppColors.lagoon,
      onSecondary: AppColors.darkness,
      tertiary: AppColors.bloodmoon,
      onTertiary: Colors.white,
      error: AppColors.bloodmoon,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: AppTypography.darkTextTheme,
      appBarTheme: DoomscrllAppBarTheme.darkAppBarTheme,
      filledButtonTheme: DoomscrllButtonTheme.darkFilledButtonTheme,
      outlinedButtonTheme: DoomscrllButtonTheme.darkOutlinedButtonTheme,
      textButtonTheme: DoomscrllButtonTheme.darkTextButtonTheme,
      iconButtonTheme: DoomscrllButtonTheme.darkIconButtonTheme,
      inputDecorationTheme: DoomscrllInputTheme.darkInputDecorationTheme,
    );
  }
}
