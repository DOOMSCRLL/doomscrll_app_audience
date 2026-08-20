import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/youtube_utils.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:flutter/material.dart";
import "package:youtube_player_iframe/youtube_player_iframe.dart";

class YoutubeFacadePlayer extends StatefulWidget {
  final String url;

  const YoutubeFacadePlayer({super.key, required this.url});

  @override
  State<YoutubeFacadePlayer> createState() => _YoutubeFacadePlayerState();
}

class _YoutubeFacadePlayerState extends State<YoutubeFacadePlayer> {
  YoutubePlayerController? _controller;
  bool _isPlayerLoaded = false;

  void _loadPlayer(String videoId) {
    setState(() {
      _controller = YoutubePlayerController.fromVideoId(
        videoId: videoId,
        autoPlay: true,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          origin: "https://www.youtube-nocookie.com",
          strictRelatedVideos: true,
        ),
      );
      _isPlayerLoaded = true;
    });
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoId = extractYoutubeVideoId(widget.url);
    if (videoId == null) return const SizedBox.shrink();

    if (_isPlayerLoaded && _controller != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: YoutubePlayer(
            controller: _controller!,
          ),
        ),
      );
    }

    return _YoutubePlayerFacade(
      thumbnailUrl: getYoutubeThumbnailUrl(videoId),
      onPlayPressed: () => _loadPlayer(videoId),
    );
  }
}

class _YoutubePlayerFacade extends StatelessWidget {
  final String thumbnailUrl;
  final VoidCallback onPlayPressed;

  const _YoutubePlayerFacade({required this.thumbnailUrl, required this.onPlayPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPlayPressed,
      borderRadius: BorderRadius.circular(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  thumbnailUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(child: DoomscrllSpinner(size: 32));
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.darkness,
                      child: const Center(
                        child: DoomscrllIcon(DoomscrllIconName.doomeyeClosed, size: 48, color: AppColors.bloodmoon),
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: AppColors.darkness.withValues(alpha: 0.6),
                  child: const Center(
                    child: DoomscrllIcon(DoomscrllIconName.play, size: 36, color: AppColors.lagoon),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
