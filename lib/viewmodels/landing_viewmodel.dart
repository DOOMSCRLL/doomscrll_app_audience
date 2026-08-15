import 'package:flutter/foundation.dart';

import '../models/project_category_count.dart';
import '../services/project_service.dart';

class LandingViewModel extends ChangeNotifier {
  final ProjectService _projectService;

  List<ProjectCategoryCount> _categories = [];
  bool _isLoading = false;
  String? _errorMessage;

  LandingViewModel({ProjectService? projectService})
      : _projectService = projectService ?? ProjectService();

  List<ProjectCategoryCount> get categories => List.unmodifiable(_categories);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  int get totalProjectCount =>
      _categories.fold(0, (sum, item) => sum + item.count);

  Future<void> fetchTodaysCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _categories = await _projectService.getCategoryCounts(date: DateTime.now());
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
