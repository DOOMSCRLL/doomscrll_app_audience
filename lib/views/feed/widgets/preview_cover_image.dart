import "package:flutter/material.dart";

import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_image_mask.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";

class PreviewCoverImage extends StatelessWidget {
  final String coverImagePath;
  final DoomscrllMaskShape shape;

  const PreviewCoverImage({
    super.key,
    required this.coverImagePath,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: ClipPath(
        clipper: DoomscrllImageMaskClipper(shape),
        child: Container(
          color: AppColors.darkness,
          child: Image.network(
            coverImagePath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(child: DoomscrllSpinner(size: 32));
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: DoomscrllIcon(DoomscrllIconName.doomeyeClosed, size: 48, color: AppColors.bloodmoon),
              );
            },
          ),
        ),
      ),
    );
  }
}
