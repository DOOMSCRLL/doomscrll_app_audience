import 'api_service.dart';
import '../models/project_category_count.dart';

class ProjectService {
  final ApiService _apiService;

  ProjectService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  Future<List<ProjectCategoryCount>> getCategoryCounts({DateTime? date}) async {
    final targetDate = date ?? DateTime.now();
    final endpoint = '/projects/projects-per-category?date=${targetDate.toIso8601String()}';

    final body = await _apiService.get(endpoint);
    final List<dynamic> list = body['data'] as List<dynamic>;

    return list
        .map((item) => ProjectCategoryCount.fromJson(item as Map<String, dynamic>))
        .where((item) => !item.category.startsWith('Internal_') && item.count > 0)
        .toList();
  }
}
