import "package:doomscrll_app_audience/l10n/dict_extension.dart";
import "package:doomscrll_app_audience/models/project_category_count.dart";
import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/string_extensions.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_wavy_divider.dart";
import "package:doomscrll_app_audience/views/feed/widgets/category_dropdown.dart";
import "package:doomscrll_app_audience/views/feed/widgets/tag_search_select.dart";
import "package:flutter/material.dart";

class QuerySheet extends StatefulWidget {
  final String currentCategory;
  final String? currentTag;
  final List<ProjectCategoryCount> availableCategories;
  final void Function({required String category, String? tag}) onApply;

  const QuerySheet({
    super.key,
    required this.currentCategory,
    this.currentTag,
    required this.availableCategories,
    required this.onApply,
  });

  static Future<void> show({
    required BuildContext context,
    required String currentCategory,
    String? currentTag,
    required List<ProjectCategoryCount> availableCategories,
    required void Function({required String category, String? tag}) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: AppColors.darkness,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: QuerySheet(
          currentCategory: currentCategory,
          currentTag: currentTag,
          availableCategories: availableCategories,
          onApply: onApply,
        ),
      ),
    );
  }

  @override
  State<QuerySheet> createState() => _QuerySheetState();
}

class _QuerySheetState extends State<QuerySheet> {
  late String _selectedCategory;
  late String? _selectedTag;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.currentCategory;
    _selectedTag = widget.currentTag;
  }

  bool get _hasChanged => _selectedCategory != widget.currentCategory || _selectedTag != widget.currentTag;

  void _handleCategoryChange(String newCategory) {
    setState(() {
      _selectedCategory = newCategory;
      _selectedTag = null;
    });
  }

  void _handleTagChange(String? newTag) => setState(() => _selectedTag = newTag);

  void _applyFilters() {
    widget.onApply(category: _selectedCategory, tag: _selectedTag);
    Navigator.of(context).pop();
  }

  void _closeQuerySheet() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            Text(context.dict.queryMenuTitle, style: Theme.of(context).textTheme.titleLarge),

            Text(context.dict.queryMenuLabelCategory, style: Theme.of(context).textTheme.bodyLarge),
            CategoryDropdown(
              selectedCategory: _selectedCategory,
              availableCategories: widget.availableCategories,
              onChanged: _handleCategoryChange,
            ),

            const DoomscrllWavyDivider(),

            Text(context.dict.queryMenuLabelTag, style: Theme.of(context).textTheme.bodyLarge),
            TagSearchSelect(
              selectedCategory: _selectedCategory,
              selectedTag: _selectedTag,
              onTagSelected: _handleTagChange,
            ),

            const DoomscrllWavyDivider(),

            FilledButton.icon(
              icon: const DoomscrllIcon(DoomscrllIconName.filter, size: 24),
              label: Text(context.dict.queryMenuActionLabelApply.upper),
              onPressed: _hasChanged ? _applyFilters : null,
            ),
            TextButton.icon(
              icon: const DoomscrllIcon(DoomscrllIconName.arrowBack, size: 24),
              label: Text(context.dict.queryMenuActionLabelCancel.upper),
              onPressed: _closeQuerySheet,
            ),
          ],
        ),
      ),
    );
  }
}
