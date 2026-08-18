import "package:doomscrll_app_audience/l10n/category_l10n_extension.dart";
import "package:doomscrll_app_audience/l10n/dict_extension.dart";
import "package:doomscrll_app_audience/models/project_category_count.dart";
import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:flutter/material.dart";

class CategoryDropdown extends StatelessWidget {
  final String selectedCategory;
  final List<ProjectCategoryCount> availableCategories;
  final ValueChanged<String>? onChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.availableCategories,
    this.onChanged,
  });

  List<DropdownMenuItem<String>> _buildDropdownItems(BuildContext context) => availableCategories
      .map(
        (c) => DropdownMenuItem<String>(
          value: c.category,
          child: Text("${context.dict.getCategoryLabel(c.category)} (${c.count})"),
        ),
      )
      .toList();

  void handleCategoryChange(String? newCategory) {
    if (newCategory != null && onChanged != null) onChanged!(newCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkness,
        border: Border.all(color: AppColors.lagoon, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCategory,
          dropdownColor: AppColors.darkness,
          iconEnabledColor: AppColors.lagoon,
          isExpanded: true,
          style: Theme.of(context).textTheme.bodyLarge,
          items: _buildDropdownItems(context),
          onChanged: handleCategoryChange,
        ),
      ),
    );
  }
}
