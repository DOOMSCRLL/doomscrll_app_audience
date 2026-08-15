import "../models/project_category_count.dart";
import "api_service.dart";

class ProjectService {
  final ApiService _apiService;

  ProjectService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  Future<List<ProjectCategoryCount>> getCategoryCounts({DateTime? date}) async {
    final targetDate = date ?? DateTime.now();
    final formattedDate =
        '${targetDate.year}-${targetDate.month.toString().padLeft(2, '0')}-${targetDate.day.toString().padLeft(2, '0')}';
    final endpoint = "/projects/projects-per-category?date=$formattedDate";

    final body = await _apiService.get(endpoint);
    final List<dynamic> list = body["data"] as List<dynamic>;

    return list
        .map((item) => ProjectCategoryCount.fromJson(item as Map<String, dynamic>))
        .where((item) => !item.category.startsWith("Internal_") && item.count > 0)
        .toList();
  }
}
