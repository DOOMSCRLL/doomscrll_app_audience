String? extractYoutubeVideoId(String? url) {
  if (url == null || url.trim().isEmpty) return null;
  final regExp = RegExp(
    r"(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/|youtube\.com\/shorts\/)([a-zA-Z0-9_-]{11})",
    caseSensitive: false,
  );
  final match = regExp.firstMatch(url);
  return match?.group(1);
}

String getYoutubeThumbnailUrl(String videoId) {
  return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
}
