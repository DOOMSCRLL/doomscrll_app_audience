import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/string_extensions.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:flutter/material.dart";

class ExpandedImageView extends StatelessWidget {
  final String imageUrl;
  final String heroTag;
  final String projectName;

  const new({super.key, required this.imageUrl, required this.heroTag, required this.projectName});

  static void open(
    BuildContext context, {
    required String imageUrl,
    required String heroTag,
    required String projectName,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: AppColors.darkness.withValues(alpha: 0.9),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: ExpandedImageView(imageUrl: imageUrl, heroTag: heroTag, projectName: projectName),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            InteractiveViewer(
              minScale: 0.8,
              maxScale: 4.0,
              child: Hero(
                tag: heroTag,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
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
            FilledButton.icon(
              icon: const DoomscrllIcon(DoomscrllIconName.arrowBack, size: 24),
              label: Text("BACK".upper),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
