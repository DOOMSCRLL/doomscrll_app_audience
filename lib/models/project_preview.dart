import "package:doomscrll_app_audience/utils/cdn_utils.dart";

class ProjectPreview {
  final String referenceId;
  final String name;
  final String authorUsername;
  final String category;
  final List<String> tags;
  final String? coverImagePath;

  const ProjectPreview({
    required this.referenceId,
    required this.name,
    required this.authorUsername,
    required this.category,
    required this.tags,
    this.coverImagePath,
  });

  factory ProjectPreview.fromMap(Map<String, dynamic> map) {
    final creatorObj = map["creator"] as Map<String, dynamic>?;
    final authorUsername = creatorObj?["username"] as String? ??
        map["authorUsername"] as String? ??
        "";
    final rawTags = map["tags"] as List<dynamic>?;
    final parsedTags = rawTags != null
        ? rawTags.map((e) => e.toString()).toList()
        : <String>[];

    return ProjectPreview(
      referenceId: map["referenceId"] as String? ?? "",
      name: map["name"] as String? ?? "",
      authorUsername: authorUsername,
      category: map["category"] as String? ?? "",
      tags: parsedTags,
      coverImagePath: resolveCDNImagePath(map["coverImagePath"] as String?),
    );
  }
}
