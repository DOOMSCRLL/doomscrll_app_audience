import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum DoomscrllIconName {
  add,
  arrowBack,
  arrowDropdown,
  arrowExternal,
  arrowForward,
  avatarAnon,
  avatarSigned,
  cancel,
  copy,
  doomeye,
  doomeyeClosed,
  filter,
  hamburger,
  help,
  home,
  link,
  mail,
  play,
  purchase,
  remove,
  search,
  settings,
  starmark,
  upload,
}

class DoomscrllIcon extends StatelessWidget {
  final DoomscrllIconName name;
  final double size;
  final Color? color;

  const DoomscrllIcon(
    this.name, {
    super.key,
    this.size = 24.0,
    this.color,
  });

  String get _assetPath {
    final fileName = switch (name) {
      DoomscrllIconName.add => 'add.svg',
      DoomscrllIconName.arrowBack => 'arrow_back.svg',
      DoomscrllIconName.arrowDropdown => 'arrow_dropdown.svg',
      DoomscrllIconName.arrowExternal => 'arrow_external.svg',
      DoomscrllIconName.arrowForward => 'arrow_forward.svg',
      DoomscrllIconName.avatarAnon => 'avatar_anon.svg',
      DoomscrllIconName.avatarSigned => 'avatar_signed.svg',
      DoomscrllIconName.cancel => 'cancel.svg',
      DoomscrllIconName.copy => 'copy.svg',
      DoomscrllIconName.doomeye => 'doomeye.svg',
      DoomscrllIconName.doomeyeClosed => 'doomeye_closed.svg',
      DoomscrllIconName.filter => 'filter.svg',
      DoomscrllIconName.hamburger => 'hamburger.svg',
      DoomscrllIconName.help => 'help.svg',
      DoomscrllIconName.home => 'home.svg',
      DoomscrllIconName.link => 'link.svg',
      DoomscrllIconName.mail => 'mail.svg',
      DoomscrllIconName.play => 'play.svg',
      DoomscrllIconName.purchase => 'purchase.svg',
      DoomscrllIconName.remove => 'remove.svg',
      DoomscrllIconName.search => 'search.svg',
      DoomscrllIconName.settings => 'settings.svg',
      DoomscrllIconName.starmark => 'starmark.svg',
      DoomscrllIconName.upload => 'upload.svg',
    };
    return 'assets/icons/$fileName';
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return SvgPicture.asset(
      _assetPath,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}
