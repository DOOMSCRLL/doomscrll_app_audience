import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class DoomscrllWordmark extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;

  const DoomscrllWordmark({
    super.key,
    this.height,
    this.width = double.infinity,
    this.color,
    this.fit = BoxFit.fitWidth,
  });

  @override
  Widget build(BuildContext context) {
    final wordmarkColor = color ?? Theme.of(context).colorScheme.primary;

    return SvgPicture.asset(
      "assets/icons/doomscrll_wordmark.svg",
      height: height,
      width: width,
      fit: fit,
      colorFilter: ColorFilter.mode(wordmarkColor, BlendMode.srcIn),
    );
  }
}
