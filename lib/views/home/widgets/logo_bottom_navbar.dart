import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_logo.dart";
import "package:doomscrll_app_audience/views/common/context_sheet.dart";
import "package:flutter/material.dart";

class LogoBottomNavbar extends StatelessWidget {
  const LogoBottomNavbar({super.key});

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
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => _showContextMenu(context),
                    icon: const DoomscrllIcon(DoomscrllIconName.hamburger, color: AppColors.lagoon, size: 24),
                  ),
                ),
              ),
              const DoomscrllLogo(color: AppColors.bloodmoon, size: 64),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
