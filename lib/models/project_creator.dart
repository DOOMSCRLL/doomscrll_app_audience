class ProjectCreator {
  final String username;
  final String? description;
  final String? url;

  const ProjectCreator({
    required this.username,
    this.description,
    this.url,
  });

  factory ProjectCreator.fromMap(Map<String, dynamic> map) {
    return ProjectCreator(
      username: map["username"] as String? ?? "",
      description: map["description"] as String?,
      url: map["url"] as String?,
    );
  }
}
