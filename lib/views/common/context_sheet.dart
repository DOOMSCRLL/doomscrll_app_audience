import "package:doomscrll_app_audience/l10n/dict_extension.dart";
import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/utils/string_extensions.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_wavy_divider.dart";
import "package:doomscrll_app_audience/views/common/language_selector.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class ContextSheet extends StatelessWidget {
  const ContextSheet({super.key});

  Future<void> _launch(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _handleLaunch(BuildContext context, String urlString) {
    Navigator.of(context).pop();
    _launch(urlString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          const LanguageSelector(),
          const DoomscrllWavyDivider(color: AppColors.lagoon),
          TextButton.icon(
            onPressed: () => _handleLaunch(context, "mailto:hello@doomscrll.com"),
            label: Text(context.dict.contextMenuLabelContactUs.upper),
            icon: const DoomscrllIcon(DoomscrllIconName.arrowForward, size: 16),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () => _handleLaunch(context, "https://doomscrll.com/help"),
            label: Text(context.dict.contextMenuLabelHelp.upper),
            icon: const DoomscrllIcon(DoomscrllIconName.arrowExternal, size: 16),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () => _handleLaunch(context, "https://doomscrll.com/legal.txt"),
            label: Text(context.dict.contextMenuLabelLegal.upper),
            icon: const DoomscrllIcon(DoomscrllIconName.arrowExternal, size: 16),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}
