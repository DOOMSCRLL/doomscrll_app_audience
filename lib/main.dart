import "package:flutter/material.dart";
import "package:wakelock_plus/wakelock_plus.dart";

import "l10n/app_localizations.dart";
import "theme/app_theme.dart";
import "views/landing_screen.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DOOMSCRLL",
      theme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const LandingScreen(),
    );
  }
}

