import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_image_mask.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:flutter/material.dart";

class ProjectCoverCard extends StatelessWidget {
  final String coverImagePath;
  const new({super.key, String? coverImagePath}) : coverImagePath = coverImagePath ?? "MISSING_DEFAULT_COVER_IMG_PATH";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: ClipPath(
        clipper: const DoomscrllImageMaskClipper(DoomscrllMaskShape.ticket),
        child: Container(
          width: screenWidth,
          height: screenWidth,
          color: AppColors.darkness,
          child: Image.network(
            coverImagePath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(child: DoomscrllSpinner(size: 40));
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: DoomscrllIcon(DoomscrllIconName.doomeyeClosed, size: 64, color: AppColors.bloodmoon),
              );
            },
          ),
        ),
      ),
    );
  }
}
