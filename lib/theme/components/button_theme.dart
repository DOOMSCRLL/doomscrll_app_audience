import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:flutter/material.dart";

abstract final class DoomscrllButtonTheme {
  static const TextStyle _buttonTextStyle = TextStyle(
    fontFamily: "SpaceMono",
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 1.2,
  );

  static FilledButtonThemeData get darkFilledButtonTheme {
    return FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: const WidgetStatePropertyAll(_buttonTextStyle),
        minimumSize: const WidgetStatePropertyAll(Size(0, 48)),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.lagoon.withValues(alpha: 0.2);
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.bloodmoon;
          }
          return AppColors.lagoon;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.darkness.withValues(alpha: 0.5);
          }
          return AppColors.darkness;
        }),
      ),
    );
  }

  static OutlinedButtonThemeData get darkOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: const WidgetStatePropertyAll(_buttonTextStyle),
        minimumSize: const WidgetStatePropertyAll(Size(0, 48)),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.bloodmoon;
          }
          return AppColors.darkness;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.lagoon.withValues(alpha: 0.2);
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.darkness;
          }
          return AppColors.lagoon;
        }),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: AppColors.lagoon.withValues(alpha: 0.2), width: 3);
          }
          if (states.contains(WidgetState.pressed)) {
            return const BorderSide(color: AppColors.bloodmoon, width: 3);
          }
          return const BorderSide(color: AppColors.lagoon, width: 3);
        }),
      ),
    );
  }

  static TextButtonThemeData get darkTextButtonTheme {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: const WidgetStatePropertyAll(_buttonTextStyle),
        minimumSize: const WidgetStatePropertyAll(Size(0, 48)),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.bloodmoon;
          }
          return AppColors.darkness;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.lagoon.withValues(alpha: 0.2);
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.darkness;
          }
          return AppColors.lagoon;
        }),
      ),
    );
  }

  static IconButtonThemeData get darkIconButtonTheme {
    return IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.lagoon.withValues(alpha: 0.25);
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.bloodmoon;
          }
          return AppColors.lagoon;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.darkness.withValues(alpha: 0.25);
          }
          return null;
        }),
      ),
    );
  }
}
