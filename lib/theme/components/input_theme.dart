import "package:flutter/material.dart";

import "package:doomscrll_app_audience/theme/app_colors.dart";

abstract final class DoomscrllInputTheme {
  static InputDecorationTheme get darkInputDecorationTheme {
    const borderRadius = BorderRadius.all(Radius.circular(16));

    return const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkness,
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      hintStyle: TextStyle(
        fontFamily: "Playfair",
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        fontSize: 20,
        color: Colors.grey,
      ),
      labelStyle: TextStyle(
        fontFamily: "Playfair",
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: AppColors.lagoon,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.lagoon, width: 3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.lagoon, width: 3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.lagoon, width: 3),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.bloodmoon, width: 3),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.bloodmoon, width: 3),
      ),
    );
  }
}
