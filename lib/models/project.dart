import "package:doomscrll_app_audience/models/platform_record.dart";
import "package:doomscrll_app_audience/models/project_creator.dart";
import "package:doomscrll_app_audience/utils/cdn_utils.dart";

class Project {
  final String referenceId;
  final String name;
  final String category;
  final String primaryPlatform;
  final String primaryUrl;
  final String? description;
  final List<String> tags;
  final List<String> features;
  final String? coverImagePath;
  final List<String>? screenshotPaths;
  final List<PlatformRecord>? secondaryPlatforms;
  final String? videoUrl;
  final ProjectCreator creator;
  final String? createdAt;

  const Project({
    required this.referenceId,
    required this.name,
    required this.category,
    required this.primaryPlatform,
    required this.primaryUrl,
    this.description,
    required this.tags,
    required this.features,
    this.coverImagePath,
    this.screenshotPaths,
    this.secondaryPlatforms,
    this.videoUrl,
    required this.creator,
    this.createdAt,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    final rawTags = map["tags"] as List<dynamic>?;
    final parsedTags = rawTags != null ? rawTags.map((e) => e.toString()).toList() : <String>[];

    final rawFeatures = map["features"] as List<dynamic>?;
    final parsedFeatures = rawFeatures != null ? rawFeatures.map((e) => e.toString()).toList() : <String>[];

    final rawScreenshots = map["screenshotPaths"] as List<dynamic>?;
    final parsedScreenshots = rawScreenshots?.map((e) => resolveCdnImagePath(e.toString())!).toList();

    final rawSecondary = map["secondaryPlatforms"] as List<dynamic>?;
    final parsedSecondary = rawSecondary?.map((e) => PlatformRecord.fromMap(e as Map<String, dynamic>)).toList();

    final creatorObj = map["creator"] as Map<String, dynamic>? ?? {};

    return Project(
      referenceId: map["referenceId"] as String? ?? "",
      name: map["name"] as String? ?? "",
      category: map["category"] as String? ?? "",
      primaryPlatform: map["primaryPlatform"] as String? ?? "",
      primaryUrl: map["primaryUrl"] as String? ?? "",
      description: map["description"] as String?,
      tags: parsedTags,
      features: parsedFeatures,
      coverImagePath: resolveCdnImagePath(map["coverImagePath"] as String?),
      screenshotPaths: parsedScreenshots,
      secondaryPlatforms: parsedSecondary,
      videoUrl: map["videoUrl"] as String?,
      creator: ProjectCreator.fromMap(creatorObj),
      createdAt: map["createdAt"] as String?,
    );
  }
}
