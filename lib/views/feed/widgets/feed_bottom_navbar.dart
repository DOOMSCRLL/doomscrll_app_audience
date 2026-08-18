import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/context_sheet.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:flutter/material.dart";

class FeedBottomNavbar extends StatelessWidget {
  final int currentPage;
  final int countPages;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onNextPage;
  final VoidCallback onFilterPressed;

  const new({
    super.key,
    required this.currentPage,
    required this.countPages,
    this.onPreviousPage,
    this.onNextPage,
    required this.onFilterPressed,
  });

  void _showContextMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: AppColors.darkness,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
      builder: (context) => const ContextSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _showContextMenu(context),
                icon: const DoomscrllIcon(DoomscrllIconName.hamburger, color: AppColors.lagoon, size: 24),
              ),
              Row(
                spacing: 8,
                children: [
                  IconButton(
                    onPressed: onPreviousPage,
                    icon: const DoomscrllIcon(DoomscrllIconName.arrowBack),
                  ),
                  Text(
                    "$currentPage/$countPages",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  IconButton(
                    onPressed: onNextPage,
                    icon: const DoomscrllIcon(DoomscrllIconName.arrowForward),
                  ),
                ],
              ),
              IconButton.filled(
                onPressed: onFilterPressed,
                icon: const DoomscrllIcon(DoomscrllIconName.filter, color: AppColors.darkness),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
