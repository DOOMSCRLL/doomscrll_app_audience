import "package:doomscrll_app_audience/models/project_preview.dart";
import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/tag_chip.dart";
import "package:doomscrll_app_audience/views/feed/widgets/preview_cover_image.dart";
import "package:flutter/material.dart";

class ProjectPreviewCard extends StatelessWidget {
  final ProjectPreview project;
  final VoidCallback? onTap;

  const ProjectPreviewCard({super.key, required this.project, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Text("@${project.authorUsername}", style: Theme.of(context).textTheme.labelLarge),
        PreviewCoverImage(coverImagePath: project.coverImagePath!),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: List.generate(
              project.tags.length,
              (index) => TagChip(tag: project.tags[index], isItalic: index.isOdd),
            ),
          ),
        ),
        Row(
          children: [
            const DoomscrllIcon(DoomscrllIconName.starmark, size: 24, color: AppColors.lagoon),
            Expanded(
              child: Text(
                project.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            IconButton(onPressed: onTap, icon: const DoomscrllIcon(DoomscrllIconName.arrowForward, size: 24)),
          ],
        ),
      ],
    );
  }
}
