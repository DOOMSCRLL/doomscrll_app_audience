import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:flutter/material.dart";

class CategoryAnchor extends StatelessWidget {
  final String label;
  final String count;
  final VoidCallback? onPressed;

  const CategoryAnchor({
    super.key,
    required this.label,
    required this.count,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$label ($count)",
            style: theme.textTheme.labelLarge?.copyWith(
              color: AppColors.lagoon,
            ),
          ),
          const SizedBox(width: 8),
          const DoomscrllIcon(
            DoomscrllIconName.arrowForward,
            size: 16,
            color: AppColors.lagoon,
          ),
        ],
      ),
    );
  }
}
