// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'DOOMSCRLL';

  @override
  String get landingTextLoading => 'Loading today\'s projects...';

  @override
  String get landingTextNoData => 'There seems to be no projects for today!\nPlease check again tomorrow~';

  @override
  String get landingTextCopy => 'What are you looking for today?';

  @override
  String get feedActionLabelRetry => 'Try again';

  @override
  String get feedCopyNoProjects => 'It seems that there are no projects here!';

  @override
  String get contextMenuLabelContactUs => 'Contact us';

  @override
  String get contextMenuLabelHelp => 'Help';

  @override
  String get contextMenuLabelLegal => 'Legal';

  @override
  String get queryMenuTitle => 'Filter projects';

  @override
  String get queryMenuLabelCategory => 'Change the category:';

  @override
  String get queryMenuLabelTag => 'Select a tag:';

  @override
  String get queryMenuTagSearchHint => 'Search for a #tag.';

  @override
  String get queryMenuActionLabelApply => 'Apply filters';

  @override
  String get queryMenuActionLabelCancel => 'Cancel';

  @override
  String get categoryLabelVideoGames => 'Video Games';

  @override
  String get categoryLabelTabletop => 'Tabletop Games';

  @override
  String get categoryLabelSoftwareTools => 'Software & Tools';

  @override
  String get categoryLabelDigitalAssets => 'Digital Assets';

  @override
  String get categoryLabelPublishing => 'Publishing';

  @override
  String get categoryLabelAudio => 'Audio';

  @override
  String get categoryLabelVideo => 'Video';

  @override
  String get categoryLabelGoods => 'Physical Goods';

  @override
  String get categoryLabelFood => 'Foods';

  @override
  String get categoryLabelLocal => 'Local Businesses';

  @override
  String get categoryLabelInternalSocials => 'Social Platforms';

  @override
  String get categoryLabelInternalCrowdfunding => 'Crowdfunding Platforms';
}
