import 'package:flutter/material.dart';

abstract final class AppTypography {
  static TextTheme get darkTextTheme {
    final base = ThemeData.dark().textTheme;

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        fontFamily: 'SpaceMono',
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontFamily: 'SpaceMono',
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontFamily: 'SpaceMono',
        fontWeight: FontWeight.w700,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
