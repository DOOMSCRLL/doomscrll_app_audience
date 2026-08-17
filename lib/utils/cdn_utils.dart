const String publicCdnProjectBaseUrl = "https://cdn.doomscrll.com/";

String? resolveCdnImagePath(String? path) {
  if (path == null || path.isEmpty) return null;
  if (path.startsWith("http://") || path.startsWith("https://")) return path;

  final cleanBase = publicCdnProjectBaseUrl.endsWith("/") ? publicCdnProjectBaseUrl : "$publicCdnProjectBaseUrl/";
  final cleanPath = path.startsWith("/") ? path.substring(1) : path;
  return "$cleanBase$cleanPath";
}
