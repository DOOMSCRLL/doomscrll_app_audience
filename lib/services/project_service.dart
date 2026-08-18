import "package:doomscrll_app_audience/models/project.dart";
import "package:doomscrll_app_audience/models/project_category_count.dart";
import "package:doomscrll_app_audience/models/project_preview.dart";
import "package:doomscrll_app_audience/services/api_service.dart";

class ProjectFeedResult {
  final List<ProjectPreview> previews;
  final int? queryCount;

  const ProjectFeedResult({
    required this.previews,
    this.queryCount,
  });
}

class ProjectService {
  final ApiService _apiService;

  ProjectService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  Future<List<ProjectCategoryCount>> getProjectCountsFor({DateTime? date}) async {
    final targetDate = date ?? DateTime.now();
    final formattedDate =
        "${targetDate.year}-${targetDate.month.toString().padLeft(2, "0")}-${targetDate.day.toString().padLeft(2, "0")}";
    final endpoint = "/projects/projects-per-category?date=$formattedDate";

    final body = await _apiService.get(endpoint);
    final List<dynamic> list = body["data"] as List<dynamic>;

    return list
        .map((item) => ProjectCategoryCount.fromJson(item as Map<String, dynamic>))
        .where((item) => !item.category.startsWith("Internal_") && item.count > 0)
        .toList();
  }

  Future<ProjectFeedResult> getProjectFeed({
    required String category,
    String? tag,
    String? platform,
    int page = 1,
    int? batchSize = 10,
  }) async {
    final queryParams = <String, String>{
      "category": category,
      "page": page.toString(),
    };
    if (batchSize != null) queryParams["batchSize"] = batchSize.toString();
    if (tag != null && tag.isNotEmpty) queryParams["tag"] = tag;
    if (platform != null && platform.isNotEmpty) queryParams["platform"] = platform;

    final queryString = Uri(queryParameters: queryParams).query;
    final endpoint = "/projects?$queryString";

    final body = await _apiService.get(endpoint);
    final List<dynamic> list = body["data"] as List<dynamic>;
    final queryCount = body["queryCount"] as int?;

    final previews = list
        .map((item) => ProjectPreview.fromMap(item as Map<String, dynamic>))
        .toList();

    return ProjectFeedResult(
      previews: previews,
      queryCount: queryCount,
    );
  }

  Future<Project?> getProjectByReference(String referenceId) async {
    try {
      final body = await _apiService.get("/projects/$referenceId");
      final data = body["data"] as Map<String, dynamic>?;
      if (data == null) return null;
      return Project.fromMap(data);
    } catch (_) {
      return null;
    }
  }
}

final projectService = ProjectService();
