import "package:doomscrll_app_audience/l10n/app_localizations.dart";

extension CategoryL10nExtension on AppLocalizations {
  String getCategoryLabel(String categoryKey) {
    return switch (categoryKey) {
      "Video Games" => categoryLabelVideoGames,
      "Tabletop" => categoryLabelTabletop,
      "Software & Tools" => categoryLabelSoftwareTools,
      "Digital Assets" => categoryLabelDigitalAssets,
      "Publishing" => categoryLabelPublishing,
      "Audio" => categoryLabelAudio,
      "Video" => categoryLabelVideo,
      "Goods" => categoryLabelGoods,
      "Food" => categoryLabelFood,
      "Local" => categoryLabelLocal,
      "Internal_Socials" => categoryLabelInternalSocials,
      "Internal_Crowdfunding" => categoryLabelInternalCrowdfunding,
      _ => categoryKey,
    };
  }
}
