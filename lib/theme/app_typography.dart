import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:flutter/material.dart";

abstract final class AppTypography {
  static const playfairOpszDisplay = FontVariation("opsz", 36.0);
  static const playfairOpszTitle = FontVariation("opsz", 24.0);
  static const playfairOpszBody = FontVariation("opsz", 16.0);

  static const playfairWeightRegular = FontVariation("wght", 400.0);
  static const playfairWeightMedium = FontVariation("wght", 500.0);
  static const playfairWeightBold = FontVariation("wght", 700.0);

  static TextTheme get darkTextTheme {
    final base = ThemeData.dark().textTheme.apply(
          bodyColor: AppColors.lagoon,
          displayColor: AppColors.lagoon,
        );

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszDisplay, playfairWeightMedium],
      ),
      displayMedium: base.displayMedium?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszDisplay, playfairWeightMedium],
      ),
      displaySmall: base.displaySmall?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszDisplay, playfairWeightMedium],
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
      ),
      titleLarge: base.titleLarge?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontStyle: FontStyle.italic,
        fontVariations: const [playfairOpszTitle, playfairWeightMedium],
      ),
      titleMedium: base.titleMedium?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontStyle: FontStyle.italic,
        fontVariations: const [playfairOpszTitle, playfairWeightMedium],
      ),
      titleSmall: base.titleSmall?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontStyle: FontStyle.italic,
        fontVariations: const [playfairOpszTitle, playfairWeightMedium],
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszBody, playfairWeightMedium],
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszBody, playfairWeightMedium],
      ),
      bodySmall: base.bodySmall?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "Playfair",
        fontStyle: FontStyle.italic,
        fontVariations: const [playfairOpszBody, playfairWeightMedium],
      ),
      labelLarge: base.labelLarge?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
      labelMedium: base.labelMedium?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
      labelSmall: base.labelSmall?.copyWith(
        color: AppColors.lagoon,
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}
