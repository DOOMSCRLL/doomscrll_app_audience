import "package:doomscrll_app_audience/l10n/dict_extension.dart";
import "package:doomscrll_app_audience/viewmodels/landing_viewmodel.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_refresh_indicator.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:doomscrll_app_audience/views/feed/feed_screen.dart";
import "package:doomscrll_app_audience/views/home/widgets/category_anchor.dart";
import "package:doomscrll_app_audience/views/home/widgets/logo_bottom_navbar.dart";
import "package:doomscrll_app_audience/views/home/widgets/wordmark_appbar.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LandingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LandingViewModel();
    _viewModel.fetchTodaysCategories();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onCategoryPressed(String category, int count) {
    Navigator.of(context).push(
      FeedScreen.route(
        initialCategory: category,
        totalProjectCount: count,
        projectCounts: _viewModel.categories,
      ),
    );
  }

  Widget _buildBody(BuildContext context) => switch ((_viewModel.isLoading, _viewModel.categories.isEmpty)) {
    (true, true) => DoomscrllSpinner(label: context.dict.landingTextLoading, hasBlendMode: true, doFillParent: true),
    (false, true) => Center(child: Text(context.dict.landingTextNoData, style: Theme.of(context).textTheme.bodyLarge)),
    _ => LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      context.dict.landingTextCopy,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: _viewModel.categories
                        .map<Widget>(
                          (c) => CategoryAnchor(
                            category: c.category,
                            count: c.count,
                            onPressed: () => _onCategoryPressed(c.category, c.count),
                          ),
                        )
                        .toList(growable: false),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  };

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      appBar: const BrandAppbar(),
      bottomNavigationBar: const LogoBottomNavbar(),
      body: DoomscrllRefreshIndicator(
        onRefresh: _viewModel.fetchTodaysCategories,
        child: ListenableBuilder(listenable: _viewModel, builder: (context, _) => _buildBody(context)),
      ),
    );
  }
}
