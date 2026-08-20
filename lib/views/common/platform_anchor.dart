import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

import "package:doomscrll_app_audience/repositories/platform_repository.dart";
import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/external_icon.dart";

class PlatformAnchor extends StatelessWidget {
  final String platform;
  final String href;

  const PlatformAnchor({
    super.key,
    required this.platform,
    required this.href,
  });

  Future<void> _handleTap() async {
    final uri = Uri.parse(href);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final platformName = PlatformRepository.getPlatformName(platform);

    return TextButton.icon(
      onPressed: _handleTap,
      icon: ExternalIcon(platform: platform, size: 20.0),
      label: Row(
        children: [
          Expanded(
            child: Text(
              "@$platformName",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: "Playfair",
                    color: AppColors.lagoon,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 16.0),
          const DoomscrllIcon(
            DoomscrllIconName.arrowExternal,
            size: 24.0,
            color: AppColors.lagoon,
          ),
        ],
      ),
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 56.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: AppColors.darkness,
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
