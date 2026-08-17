class PlatformRecord {
  final String platform;
  final String url;

  const PlatformRecord({
    required this.platform,
    required this.url,
  });

  factory PlatformRecord.fromMap(Map<String, dynamic> map) {
    return PlatformRecord(
      platform: map["platform"] as String? ?? "",
      url: map["url"] as String? ?? "",
    );
  }
}
