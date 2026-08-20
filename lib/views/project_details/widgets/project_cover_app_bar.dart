import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class ProjectCoverAppBar extends StatelessWidget {
  final String projectName;
  final String authorHandle;
  final VoidCallback? onBackPressed;

  const ProjectCoverAppBar({super.key, required this.projectName, required this.authorHandle, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    final double notchPadding = MediaQuery.of(context).padding.top;

    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final scrollable = Scrollable.maybeOf(context);
        final double scrollPixels = scrollable?.position.hasPixels == true
            ? scrollable!.position.pixels
            : constraints.scrollOffset;

        final double remainingDistance = constraints.precedingScrollExtent - scrollPixels;
        final double dynamicTopPadding = (notchPadding - remainingDistance).clamp(0.0, notchPadding);

        return SliverAppBar(
          primary: false,
          pinned: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          toolbarHeight: kToolbarHeight + dynamicTopPadding,
          backgroundColor: AppColors.darkness,
          surfaceTintColor: Colors.transparent,
          leading: RepaintBoundary(
            child: _BackIconButton(topPadding: dynamicTopPadding, onBackPressed: onBackPressed),
          ),
          centerTitle: true,
          title: RepaintBoundary(
            child: _ProjectTitleHeader(
              topPadding: dynamicTopPadding,
              projectName: projectName,
              authorHandle: authorHandle,
            ),
          ),
        );
      },
    );
  }
}

class _BackIconButton extends StatelessWidget {
  final double topPadding;
  final VoidCallback? onBackPressed;

  const _BackIconButton({required this.topPadding, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: IconButton(
        icon: const DoomscrllIcon(DoomscrllIconName.arrowBack),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
    );
  }
}

class _ProjectTitleHeader extends StatelessWidget {
  final double topPadding;
  final String projectName;
  final String authorHandle;

  const _ProjectTitleHeader({required this.topPadding, required this.projectName, required this.authorHandle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            projectName,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            "@$authorHandle",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.lagoon),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
