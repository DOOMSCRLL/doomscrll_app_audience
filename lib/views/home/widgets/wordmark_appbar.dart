import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_wordmark.dart";
import "package:flutter/material.dart";

class BrandAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BrandAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: DoomscrllWordmark(color: AppColors.bloodmoon));
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
