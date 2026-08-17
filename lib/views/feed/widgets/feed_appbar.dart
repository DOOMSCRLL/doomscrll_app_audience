import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_wordmark.dart";
import "package:flutter/material.dart";

class FeedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const FeedAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: DoomscrllWordmark(color: AppColors.bloodmoon)),
          IconButton(icon: const DoomscrllIcon(DoomscrllIconName.home), onPressed: () => Navigator.of(context).pop()),
          //const SizedBox(width: 48.0),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
