import "package:doomscrll_app_audience/l10n/dict_extension.dart";
import "package:doomscrll_app_audience/models/project_category_count.dart";
import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/string_extensions.dart";
import "package:doomscrll_app_audience/viewmodels/feed_viewmodel.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_refresh_indicator.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_wavy_divider.dart";
import "package:doomscrll_app_audience/views/feed/widgets/feed_appbar.dart";
import "package:doomscrll_app_audience/views/feed/widgets/feed_bottom_navbar.dart";
import "package:doomscrll_app_audience/views/feed/widgets/project_preview_card.dart";
import "package:doomscrll_app_audience/views/feed/widgets/query_sheet.dart";
import "package:doomscrll_app_audience/views/project_details/project_details_screen.dart";
import "package:flutter/material.dart";

class FeedScreen extends StatefulWidget {
  final String initialCategory;
  final String? tag;
  final int totalProjectCount;
  final List<ProjectCategoryCount> projectCounts;

  const FeedScreen({
    super.key,
    required this.initialCategory,
    this.tag,
    this.totalProjectCount = 0,
    this.projectCounts = const [],
  });

  static Route<void> route({
    required String initialCategory,
    String? tag,
    int totalProjectCount = 0,
    List<ProjectCategoryCount> projectCounts = const [],
  }) {
    return MaterialPageRoute(
      builder: (context) => FeedScreen(
        initialCategory: initialCategory,
        tag: tag,
        totalProjectCount: totalProjectCount,
        projectCounts: projectCounts,
      ),
    );
  }

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final FeedViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = FeedViewModel();
    _viewModel.init(
      initialCategory: widget.initialCategory,
      tag: widget.tag,
      totalCategoryCount: widget.totalProjectCount,
      projectCounts: widget.projectCounts,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _showQueryMenu() {
    QuerySheet.show(
      context: context,
      currentCategory: _viewModel.selectedCategory,
      currentTag: _viewModel.selectedTag,
      availableCategories: _viewModel.projectCounts,
      onApply: ({required category, tag}) {
        _viewModel.init(
          initialCategory: category,
          tag: tag,
          totalCategoryCount: widget.totalProjectCount,
          projectCounts: widget.projectCounts,
        );
      },
    );
  }

  Widget _buildBottomNavbar() => ListenableBuilder(
    listenable: _viewModel,
    builder: (_, _) => FeedBottomNavbar(
      currentPage: _viewModel.currentPage,
      countPages: _viewModel.countPages,
      onPreviousPage: _viewModel.hasPrevPage ? _viewModel.previousPage : null,
      onNextPage: _viewModel.hasNextPage ? _viewModel.nextPage : null,
      onFilterPressed: _showQueryMenu,
    ),
  );

  Widget _buildBody(BuildContext context) => switch ((
    _viewModel.isLoading,
    _viewModel.errorMessage,
    _viewModel.previews.isEmpty,
  )) {
    (true, _, true) => const Center(child: DoomscrllSpinner(size: 48)),
    (_, final String err, true) => CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(err, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.bloodmoon)),
                const SizedBox(height: 16),
                OutlinedButton(onPressed: _viewModel.fetchFeed, child: Text(context.dict.feedActionLabelRetry.upper)),
              ],
            ),
          ),
        ),
      ],
    ),
    (_, _, true) => CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: Center(child: Text(context.dict.feedCopyNoProjects, style: Theme.of(context).textTheme.bodyLarge)),
        ),
      ],
    ),
    _ => ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      itemCount: _viewModel.previews.length,
      separatorBuilder: (_, _) =>
          const Padding(padding: EdgeInsets.symmetric(vertical: 40), child: DoomscrllWavyDivider()),
      itemBuilder: (context, index) {
        final preview = _viewModel.previews[index];
        return ProjectPreviewCard(
          project: preview,
          itemIndex: index,
          onTap: () {
            Navigator.of(context).push(ProjectDetailsScreen.route(referenceId: preview.referenceId));
          },
        );
      },
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FeedAppbar(),
      bottomNavigationBar: _buildBottomNavbar(),
      body: DoomscrllRefreshIndicator(
        onRefresh: _viewModel.fetchFeed,
        child: ListenableBuilder(listenable: _viewModel, builder: (context, _) => _buildBody(context)),
      ),
    );
  }
}
