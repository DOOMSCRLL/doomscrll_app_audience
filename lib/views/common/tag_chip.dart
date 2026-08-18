import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/color_utils.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:flutter/material.dart";

class TagChip extends StatelessWidget {
  final String tag;
  final bool isItalic;
  final bool isRemovable;
  final VoidCallback? onRemove;

  const TagChip({
    super.key,
    required this.tag,
    this.isItalic = false,
    this.isRemovable = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final displayTag = tag.startsWith("#") ? tag : "#$tag";
    final backgroundColor = generateColorFrom(tag);

    Widget chipChild = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(100)),
      child: Text(
        displayTag,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          color: AppColors.darkness,
        ),
      ),
    );

    if (isRemovable && onRemove != null) {
      chipChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          chipChild,
          IconButton(
            onPressed: onRemove,
            icon: const DoomscrllIcon(DoomscrllIconName.cancel, size: 16, color: AppColors.lagoon),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.only(left: 4),
          ),
        ],
      );
    }

    return chipChild;
  }
}
