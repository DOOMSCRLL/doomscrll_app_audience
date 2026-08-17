import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/viewmodels/locale_viewmodel.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_icon.dart";
import "package:flutter/material.dart";

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: localeViewModel,
      builder: (context, _) {
        return Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              value: localeViewModel.locale,
              dropdownColor: AppColors.darkness,
              focusColor: Colors.transparent,
              icon: const DoomscrllIcon(DoomscrllIconName.arrowDropdown, size: 14),
              onChanged: (locale) => locale != null ? localeViewModel.setLocale(locale) : null,
              items: const [
                DropdownMenuItem(value: Locale("en"), child: Text("🇺🇸 English")),
                DropdownMenuItem(value: Locale("tr"), child: Text("🇹🇷 Türkçe")),
              ],
            ),
          ),
        );
      },
    );
  }
}
