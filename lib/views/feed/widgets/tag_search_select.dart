import "package:doomscrll_app_audience/l10n/dict_extension.dart";
import "package:doomscrll_app_audience/repositories/tag_repository.dart";
import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/tag_chip.dart";
import "package:flutter/material.dart";

class TagSearchSelect extends StatelessWidget {
  final String selectedCategory;
  final String? selectedTag;
  final ValueChanged<String?> onTagSelected;

  const TagSearchSelect({super.key, required this.selectedCategory, this.selectedTag, required this.onTagSelected});

  Iterable<Widget> _handleQueryChange(BuildContext context, SearchController controller) {
    final availableTags = TagRepository.getTagsForCategory(selectedCategory);

    final query = controller.text.toLowerCase().trim();
    final filteredTags = query.isEmpty
        ? availableTags
        : availableTags.where((t) => t.toLowerCase().contains(query)).toList();

    final tagChips = filteredTags
        .map(
          (tag) => InkWell(
            child: TagChip(tag: tag),
            onTap: () => _handleTagSelect(tag, controller),
          ),
        )
        .toList();

    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Wrap(spacing: 16, runSpacing: 8, children: tagChips),
      ),
    ];
  }

  void _handleTagSelect(String newTag, SearchController controller) {
    onTagSelected(newTag);
    controller.closeView(newTag);
  }

  @override
  Widget build(BuildContext context) {
    if (selectedTag != null) {
      return Center(
        child: TagChip(tag: selectedTag!, isRemovable: true, onRemove: () => onTagSelected(null)),
      );
    }

    return SearchAnchor.bar(
      barHintText: context.dict.queryMenuTagSearchHint,
      barHintStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.bodyLarge),
      barLeading: const DoomscrllIcon(DoomscrllIconName.search, size: 24),
      barBackgroundColor: const WidgetStatePropertyAll(AppColors.darkness),
      barElevation: const WidgetStatePropertyAll(0),
      barSide: const WidgetStatePropertyAll(BorderSide(color: AppColors.lagoon, width: 2)),
      barShape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      dividerColor: AppColors.lagoon,
      suggestionsBuilder: _handleQueryChange,
    );
  }
}
