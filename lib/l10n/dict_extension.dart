import "package:doomscrll_app_audience/l10n/app_localizations.dart";
import "package:flutter/widgets.dart";

extension AppLocalizationsX on BuildContext {
  AppLocalizations get dict => AppLocalizations.of(this)!;
}
