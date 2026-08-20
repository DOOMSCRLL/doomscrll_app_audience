import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:flutter/material.dart";

class ScreenshotPreview extends StatelessWidget {
  final String src;
  final double height;
  final String imgTag;

  const new({super.key, required this.src, required this.height, required this.imgTag});

  Widget _buildImage() => Hero(
    tag: imgTag,
    child: Image.network(
      src,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return const Center(child: DoomscrllSpinner(size: 24));
      },
      errorBuilder: (_, _, _) =>
          const Center(child: DoomscrllIcon(DoomscrllIconName.doomeyeClosed, size: 32, color: AppColors.bloodmoon)),
    ),
  );

  Widget _buildInteractionDecor() => Container(
    padding: const EdgeInsets.all(4.0),
    decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.4), shape: BoxShape.circle),
    child: const DoomscrllIcon(DoomscrllIconName.doomeye, size: 20, color: AppColors.lagoon),
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: SizedBox(
        height: height,
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Stack(
            children: [
              Positioned.fill(child: _buildImage()),
              Positioned(top: 8, right: 8, child: _buildInteractionDecor()),
            ],
          ),
        ),
      ),
    );
  }
}
