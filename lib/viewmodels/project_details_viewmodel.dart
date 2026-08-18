import "package:doomscrll_app_audience/models/project.dart";
import "package:doomscrll_app_audience/services/project_service.dart";
import "package:flutter/foundation.dart";

class ProjectDetailsViewModel extends ChangeNotifier {
  final String referenceId;
  final ProjectService _projectService;

  Project? _project;
  bool _isLoading = false;
  String? _errorMessage;
  String? _expandedScreenshotUrl;

  ProjectDetailsViewModel({
    required this.referenceId,
    ProjectService? projectService,
    Project? initialProject,
  })  : _projectService = projectService ?? ProjectService(),
        _project = initialProject {
    if (_project == null) {
      fetchProjectDetails();
    }
  }

  Project? get project => _project;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get expandedScreenshotUrl => _expandedScreenshotUrl;

  Future<void> fetchProjectDetails() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _project = await _projectService.getProjectByReference(referenceId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void expandScreenshot(String url) {
    _expandedScreenshotUrl = url;
    notifyListeners();
  }

  void closeScreenshotPreview() {
    _expandedScreenshotUrl = null;
    notifyListeners();
  }
}
