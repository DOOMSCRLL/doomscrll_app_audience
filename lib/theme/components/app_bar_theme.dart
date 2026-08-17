import "package:flutter/material.dart";

import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/theme/app_typography.dart";

abstract final class DoomscrllAppBarTheme {
  static AppBarTheme get darkAppBarTheme {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.darkness,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: AppColors.lagoon),
      actionsIconTheme: const IconThemeData(color: AppColors.lagoon),
      titleTextStyle: AppTypography.darkTextTheme.titleLarge?.copyWith(
        color: AppColors.lagoon,
      ),
    );
  }
}
