import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/string_extensions.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:flutter/material.dart";

class CategoryAnchor extends StatelessWidget {
  final String label;
  final int count;
  final VoidCallback? onPressed;

  const CategoryAnchor({super.key, required this.label, required this.count, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      onPressed: onPressed,
      label: Text("$label ($count)".upper, style: theme.textTheme.labelLarge?.copyWith(color: AppColors.lagoon)),
      icon: const DoomscrllIcon(DoomscrllIconName.arrowForward, size: 16, color: AppColors.lagoon),
      iconAlignment: IconAlignment.end,
    );
  }
}
