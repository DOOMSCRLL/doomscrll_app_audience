import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/cdn_utils.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:http/http.dart" as http;

typedef _IconWidgetBuilder = Widget Function(double size);

class ExternalIcon extends StatefulWidget {
  final String platform;
  final double size;

  const ExternalIcon({super.key, required this.platform, this.size = 24.0});

  @override
  State<ExternalIcon> createState() => _ExternalIconState();
}

class _ExternalIconState extends State<ExternalIcon> {
  static const Set<String> _bundledPlatforms = {
    "appStore",
    "discord",
    "itchio",
    "mailList",
    "playStore",
    "spotify",
    "steam",
    "web",
    "youtube",
  };

  static final Map<String, _IconWidgetBuilder> _iconCache = {};
  static final http.Client _client = http.Client();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _resolveIcon();
  }

  @override
  void didUpdateWidget(ExternalIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.platform != widget.platform) _resolveIcon();
  }

  Future<void> _resolveIcon() async {
    final platform = widget.platform;
    if (_bundledPlatforms.contains(platform) || _iconCache.containsKey(platform)) return;

    setState(() => _isLoading = true);

    _IconWidgetBuilder builder = _buildFallback;

    try {
      final svgUrl = resolveCdnStaticAssetPath("logo-$platform.svg");
      final svgRes = await _client.get(Uri.parse(svgUrl));
      if (svgRes.statusCode == 200 && svgRes.body.contains("<svg")) {
        final svgData = svgRes.body;
        builder = (size) => SvgPicture.string(svgData, width: size, height: size, fit: BoxFit.contain);
      } else {
        final webpUrl = resolveCdnStaticAssetPath("logo-$platform.webp");
        final webpRes = await _client.get(Uri.parse(webpUrl));
        if (webpRes.statusCode == 200 && webpRes.bodyBytes.isNotEmpty && !webpRes.body.startsWith("<")) {
          final webpBytes = webpRes.bodyBytes;
          builder = (size) => Image.memory(webpBytes, width: size, height: size, fit: BoxFit.contain);
        }
      }
    } catch (_) {}

    _iconCache[platform] = builder;

    if (mounted) setState(() => _isLoading = false);
  }

  static Widget _buildFallback(double size) {
    return SizedBox(
      width: size,
      height: size,
      child: const DoomscrllIcon(DoomscrllIconName.link, color: AppColors.lagoon),
    );
  }

  Widget _buildBody() {
    final platform = widget.platform;
    final size = widget.size;

    if (_bundledPlatforms.contains(platform)) {
      return SvgPicture.asset("assets/icons/logo-$platform.svg", width: size, height: size, fit: BoxFit.contain);
    }

    if (_isLoading && !_iconCache.containsKey(platform)) {
      return _buildFallback(size);
    }

    final builder = _iconCache[platform] ?? _buildFallback;
    return builder(size);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Color(0xFF0A0A0A),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: _buildBody(),
      ),
    );
  }
}
