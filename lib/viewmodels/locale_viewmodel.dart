import "package:flutter/material.dart";

class LocaleViewModel extends ChangeNotifier {
  Locale _locale = const Locale("en");

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void setLanguageCode(String code) {
    setLocale(Locale(code));
  }

  void toggleLocale() {
    setLocale(_locale.languageCode == "en" ? const Locale("tr") : const Locale("en"));
  }
}

final localeViewModel = LocaleViewModel();
