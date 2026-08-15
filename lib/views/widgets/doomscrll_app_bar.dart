import "package:flutter/material.dart";

import "doomscrll_icon.dart";

class DoomscrllAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const DoomscrllAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    return AppBar(
      title: Text(title),
      actions: actions,
      leading: leading ??
          (canPop
              ? IconButton(
                  icon: const DoomscrllIcon(DoomscrllIconName.arrowBack),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
