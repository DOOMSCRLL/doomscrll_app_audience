class ProjectCategoryCount {
  final String category;
  final int count;

  const ProjectCategoryCount({
    required this.category,
    required this.count,
  });

  factory ProjectCategoryCount.fromJson(Map<String, dynamic> json) {
    return ProjectCategoryCount(
      category: json["category"] as String,
      count: (json["count"] as num).toInt(),
    );
  }
}
