import "package:doomscrll_app_audience/l10n/category_l10n_extension.dart";
import "package:doomscrll_app_audience/l10n/dict_extension.dart";
import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/string_extensions.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:flutter/material.dart";

class CategoryAnchor extends StatelessWidget {
  final String category;
  final int count;
  final VoidCallback? onPressed;

  const CategoryAnchor({super.key, required this.category, required this.count, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoryLabel = context.dict.getCategoryLabel(category);

    return TextButton.icon(
      onPressed: onPressed,
      label: Text("$categoryLabel ($count)".upper, style: theme.textTheme.labelLarge),
      icon: const DoomscrllIcon(DoomscrllIconName.arrowForward, size: 16, color: AppColors.lagoon),
      iconAlignment: IconAlignment.end,
    );
  }
}
