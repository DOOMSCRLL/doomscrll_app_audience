import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_logo.dart";
import "package:flutter/material.dart";

class LogoBottomNavbar extends StatelessWidget {
  const LogoBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.menu),
                  ),
                ),
              ),
              const DoomscrllLogo(color: AppColors.bloodmoon, size: 64),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
