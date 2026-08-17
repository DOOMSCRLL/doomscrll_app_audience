import "package:doomscrll_app_audience/models/project_preview.dart";
import "package:doomscrll_app_audience/services/project_service.dart";
import "package:flutter/foundation.dart";

class FeedViewModel extends ChangeNotifier {
  final ProjectService _projectService;

  FeedViewModel({ProjectService? projectService}) : _projectService = projectService ?? ProjectService();

  String _selectedCategory = "";
  String? _selectedTag;
  int _currentPage = 1;
  int _totalCategoryCount = 0;
  int? _queryCount;

  String get selectedCategory => _selectedCategory;
  String? get selectedTag => _selectedTag;
  int get currentPage => _currentPage;
  int? get queryCount => _queryCount;

  List<ProjectPreview> _previews = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ProjectPreview> get previews => _previews;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool get isFiltering => _selectedTag != null;
  int get batchSize => isFiltering ? 40 : 10;

  int get countPages {
    final total = _queryCount ?? _totalCategoryCount;
    if (total <= 0) return 1;
    return (total / batchSize).ceil();
  }

  bool get hasPrevPage => _currentPage > 1;
  bool get hasNextPage => _currentPage < countPages;

  Future<void> init({required String category, String? tag, int totalCategoryCount = 0}) async {
    _selectedCategory = category;
    _selectedTag = tag;
    _totalCategoryCount = totalCategoryCount;
    _currentPage = 1;
    await fetchFeed();
  }

  Future<void> selectCategory(String category) async {
    if (_selectedCategory == category && _selectedTag == null) return;
    _selectedCategory = category;
    _selectedTag = null;
    _currentPage = 1;
    await fetchFeed();
  }

  Future<void> selectTag(String? tag) async {
    if (_selectedTag == tag) return;
    _selectedTag = tag;
    _currentPage = 1;
    await fetchFeed();
  }

  Future<void> nextPage() async {
    if (!hasNextPage) return;
    _currentPage++;
    await fetchFeed();
  }

  Future<void> previousPage() async {
    if (!hasPrevPage) return;
    _currentPage--;
    await fetchFeed();
  }

  Future<void> fetchFeed() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _projectService.getProjectFeed(
        category: _selectedCategory,
        tag: _selectedTag,
        page: _currentPage,
        batchSize: batchSize,
      );
      _previews = result.previews;
      _queryCount = result.queryCount;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
