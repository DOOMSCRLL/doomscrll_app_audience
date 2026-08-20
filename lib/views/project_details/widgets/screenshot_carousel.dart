import "package:doomscrll_app_audience/views/project_details/widgets/expanded_image_view.dart";
import "package:doomscrll_app_audience/views/project_details/widgets/screenshot_preview.dart";
import "package:flutter/material.dart";

class ScreenshotCarousel extends StatelessWidget {
  final List<String> screenshotPaths;
  final String projectName;
  final double height;

  const ScreenshotCarousel({super.key, required this.screenshotPaths, required this.projectName, this.height = 224.0});

  void _handlePreviewTap(BuildContext context, String url, String heroTag) {
    ExpandedImageView.open(context, imageUrl: url, heroTag: heroTag, projectName: projectName);
  }

  Widget _buildScreenshotCard(BuildContext context, int index) {
    final url = screenshotPaths[index];
    final heroTag = "screenshot_${projectName}_$index";

    return GestureDetector(
      onTap: () => _handlePreviewTap(context, url, heroTag),
      child: ScreenshotPreview(key: Key(heroTag), src: url, height: height, imgTag: heroTag),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (screenshotPaths.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemCount: screenshotPaths.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16.0),
        itemBuilder: _buildScreenshotCard,
      ),
    );
  }
}
