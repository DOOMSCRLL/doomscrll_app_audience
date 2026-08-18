import "package:flutter/material.dart";

Color generateColorFrom(String text) {
  int hash = 0;
  for (int i = 0; i < text.length; i++) {
    hash = text.codeUnitAt(i) + ((hash << 5) - hash);
  }
  hash = hash.abs();

  int satHash = 0;
  final satStr = "$text-sat";
  for (int i = 0; i < satStr.length; i++) {
    satHash = satStr.codeUnitAt(i) + ((satHash << 5) - satHash);
  }
  satHash = satHash.abs();

  int litHash = 0;
  final litStr = "$text-lit";
  for (int i = 0; i < litStr.length; i++) {
    litHash = litStr.codeUnitAt(i) + ((litHash << 5) - litHash);
  }
  litHash = litHash.abs();

  final h = ((hash * 137.508) % 360).toDouble();

  const minS = 25;
  const maxS = 40;
  final s = ((minS + (satHash % (maxS - minS + 1))) / 100).toDouble();

  const minL = 72;
  const maxL = 84;
  final l = ((minL + (litHash % (maxL - minL + 1))) / 100).toDouble();

  return HSLColor.fromAHSL(1.0, h, s, l).toColor();
}
