import "package:doomscrll_app_audience/l10n/category_l10n_extension.dart";
import "package:doomscrll_app_audience/l10n/dict_extension.dart";
import "package:doomscrll_app_audience/models/platform_record.dart";
import "package:doomscrll_app_audience/models/project.dart";
import "package:doomscrll_app_audience/viewmodels/project_details_viewmodel.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_refresh_indicator.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:doomscrll_app_audience/views/common/feature_chip.dart";
import "package:doomscrll_app_audience/views/common/platform_anchor.dart";
import "package:doomscrll_app_audience/views/common/tag_chip.dart";
import "package:doomscrll_app_audience/views/project_details/widgets/detail_card.dart";
import "package:doomscrll_app_audience/views/project_details/widgets/project_cover_app_bar.dart";
import "package:doomscrll_app_audience/views/project_details/widgets/project_cover_card.dart";
import "package:doomscrll_app_audience/views/project_details/widgets/screenshot_carousel.dart";
import "package:doomscrll_app_audience/views/project_details/widgets/youtube_facade_player.dart";
import "package:flutter/material.dart";

class ProjectDetailsScreen extends StatefulWidget {
  final String referenceId;
  final Project? initialProject;

  const ProjectDetailsScreen({super.key, required this.referenceId, this.initialProject});

  static Route<void> route({required String referenceId, Project? project}) => MaterialPageRoute(
    builder: (context) => ProjectDetailsScreen(referenceId: referenceId, initialProject: project),
  );

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  late final ProjectDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ProjectDetailsViewModel(referenceId: widget.referenceId, initialProject: widget.initialProject);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Widget _buildPlatformsCol(BuildContext context, Project project) {
    final List<PlatformRecord> platforms = List.empty(growable: true);
    platforms.add(PlatformRecord(platform: project.primaryPlatform, url: project.primaryUrl));

    if (project.secondaryPlatforms != null && project.secondaryPlatforms!.isNotEmpty) {
      platforms.addAll(project.secondaryPlatforms!);
    }

    return Column(
      children: platforms.map((p) => PlatformAnchor(platform: p.platform, href: p.url)).toList(),
    );
  }

  Widget _buildDetailsColumn(BuildContext context, Project project) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    child: Column(
      spacing: 36,
      children: [
        if (project.description != null && project.description!.isNotEmpty)
          Text(project.description!, style: Theme.of(context).textTheme.bodyLarge),
        if (project.videoUrl != null && project.videoUrl!.isNotEmpty)
          DetailCard.column(
            label: context.dict.projDetailsLabelTrailer,
            child: YoutubeFacadePlayer(url: project.videoUrl!),
          ),
        DetailCard.row(
          label: context.dict.projDetailsLabelCategory,
          child: Text(
            context.dict.getCategoryLabel(project.category),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        DetailCard.row(
          label: context.dict.projDetailsLabelTags,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              project.tags.length,
              (index) => TagChip(tag: project.tags[index], isItalic: index.isOdd),
            ),
          ),
        ),
        if (project.screenshotPaths != null && project.screenshotPaths!.isNotEmpty)
          DetailCard.column(
            label: context.dict.projDetailsLabelScreenshots,
            child: ScreenshotCarousel(
              screenshotPaths: project.screenshotPaths!,
              projectName: project.name,
              height: 320,
            ),
          ),
        DetailCard.row(
          label: context.dict.projDetailsLabelFeatures,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.features.map((feat) => FeatureChip(feature: feat)).toList(),
          ),
        ),
        DetailCard.column(label: context.dict.projDetailsLabelPlatforms, child: _buildPlatformsCol(context, project)),
      ],
    ),
  );

  Widget _buildBody(BuildContext context) => switch ((_viewModel.isLoading, _viewModel.project == null)) {
    (true, true) => const Center(child: DoomscrllSpinner(doFillParent: true, hasBlendMode: true)),
    (_, true) when _viewModel.errorMessage != null => Center(
      child: Text(_viewModel.errorMessage!, style: Theme.of(context).textTheme.bodyLarge),
    ),
    _ => CustomScrollView(
      slivers: [
        ProjectCoverCard(coverImagePath: _viewModel.project!.coverImagePath ?? ""),
        ProjectCoverAppBar(projectName: _viewModel.project!.name, authorHandle: _viewModel.project!.creator.username),
        SliverToBoxAdapter(child: _buildDetailsColumn(context, _viewModel.project!)),
      ],
    ),
  };

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      body: DoomscrllRefreshIndicator(
        onRefresh: _viewModel.fetchProjectDetails,
        child: ListenableBuilder(listenable: _viewModel, builder: (context, _) => _buildBody(context)),
      ),
    );
  }
}
