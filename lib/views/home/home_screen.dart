import "package:doomscrll_app_audience/viewmodels/landing_viewmodel.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_refresh_indicator.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:doomscrll_app_audience/views/home/widgets/logo_bottom_navbar.dart";
import "package:doomscrll_app_audience/views/home/widgets/wordmark_appbar.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrandAppbar(),
      bottomNavigationBar: const LogoBottomNavbar(),
      body: DoomscrllRefreshIndicator(
        onRefresh: _viewModel.fetchTodaysCategories,
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (_, _) {
            return const SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              //child: SizedBox(width: 720, height: 1080),
              child: DoomscrllSpinner(hasBlendMode: true, hasBackdrop: true),
            );
          },
        ),
      ),
    );
  }
}
