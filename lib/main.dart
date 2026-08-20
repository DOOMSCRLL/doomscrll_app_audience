import "package:doomscrll_app_audience/l10n/app_localizations.dart";
import "package:doomscrll_app_audience/theme/app_theme.dart";
import "package:doomscrll_app_audience/viewmodels/locale_viewmodel.dart";
import "package:doomscrll_app_audience/views/home/home_screen.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:wakelock_plus/wakelock_plus.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) WakelockPlus.enable();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: localeViewModel,
      builder: (context, _) {
        return MaterialApp(
          title: "DOOMSCRLL",
          theme: AppTheme.darkTheme,
          locale: localeViewModel.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeScreen(),
        );
      },
    );
  }
}
