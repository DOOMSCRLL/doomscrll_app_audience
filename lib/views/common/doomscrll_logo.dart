import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class DoomscrllLogo extends StatelessWidget {
  final double size;
  final Color? color;

  const DoomscrllLogo({
    super.key,
    this.size = 32.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final logoColor = color ?? Theme.of(context).colorScheme.primary;

    return SvgPicture.asset(
      "assets/icons/doomscrll_logo.svg",
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
    );
  }
}
