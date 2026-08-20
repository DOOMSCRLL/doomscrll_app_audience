const String publicCdnProjectBaseUrl = "https://cdn.doomscrll.com/";
const String publicCdnStaticBaseUrl = "https://assets.doomscrll.com/";

String? resolveCdnImagePath(String? path) {
  if (path == null || path.isEmpty) return null;
  if (path.startsWith("http://") || path.startsWith("https://")) return path;

  final cleanBase = publicCdnProjectBaseUrl.endsWith("/") ? publicCdnProjectBaseUrl : "$publicCdnProjectBaseUrl/";
  final cleanPath = path.startsWith("/") ? path.substring(1) : path;
  return "$cleanBase$cleanPath";
}

String resolveCdnStaticAssetPath(String path) {
  if (path.startsWith("http://") || path.startsWith("https://")) return path;

  final cleanBase = publicCdnStaticBaseUrl.endsWith("/") ? publicCdnStaticBaseUrl : "$publicCdnStaticBaseUrl/";
  final cleanPath = path.startsWith("/") ? path.substring(1) : path;
  return "$cleanBase$cleanPath";
}
