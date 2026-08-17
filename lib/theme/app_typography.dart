import "package:flutter/material.dart";

abstract final class AppTypography {
  static const playfairOpszDisplay = FontVariation("opsz", 36.0);
  static const playfairOpszTitle = FontVariation("opsz", 24.0);
  static const playfairOpszBody = FontVariation("opsz", 16.0);

  static const playfairWeightRegular = FontVariation("wght", 400.0);
  static const playfairWeightMedium = FontVariation("wght", 500.0);
  static const playfairWeightBold = FontVariation("wght", 700.0);

  static TextTheme get darkTextTheme {
    final base = ThemeData.dark().textTheme;

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszDisplay, playfairWeightMedium],
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszDisplay, playfairWeightMedium],
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszDisplay, playfairWeightMedium],
      ),
      headlineLarge: base.headlineLarge?.copyWith(fontFamily: "SpaceMono", fontWeight: FontWeight.w700),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: "SpaceMono", fontWeight: FontWeight.w700),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: "SpaceMono", fontWeight: FontWeight.w700),
      titleLarge: base.titleLarge?.copyWith(
        fontFamily: "Playfair",
        fontStyle: FontStyle.italic,
        fontVariations: const [playfairOpszTitle, playfairWeightMedium],
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontFamily: "Playfair",
        fontStyle: FontStyle.italic,
        fontVariations: const [playfairOpszTitle, playfairWeightMedium],
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontFamily: "Playfair",
        fontStyle: FontStyle.italic,
        fontVariations: const [playfairOpszTitle, playfairWeightMedium],
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszBody, playfairWeightMedium],
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontFamily: "Playfair",
        fontVariations: const [playfairOpszBody, playfairWeightMedium],
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontFamily: "Playfair",
        fontStyle: FontStyle.italic,
        fontVariations: const [playfairOpszBody, playfairWeightMedium],
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}
