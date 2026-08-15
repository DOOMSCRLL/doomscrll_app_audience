import 'package:flutter/material.dart';
import '../app_colors.dart';

abstract final class DoomscrllInputTheme {
  static InputDecorationTheme get darkInputDecorationTheme {
    const borderRadius = BorderRadius.all(Radius.circular(16));

    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkness,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      hintStyle: const TextStyle(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        fontSize: 20,
        color: Colors.grey,
      ),
      labelStyle: const TextStyle(
        fontFamily: 'Playfair',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: AppColors.lagoon,
      ),
      border: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.lagoon, width: 3),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.lagoon, width: 3),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.lagoon, width: 3),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.bloodmoon, width: 3),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.bloodmoon, width: 3),
      ),
    );
  }
}
