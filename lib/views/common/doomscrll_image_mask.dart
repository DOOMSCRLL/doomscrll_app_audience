import "package:flutter/material.dart";
import "package:path_parsing/path_parsing.dart";

enum DoomscrllMaskShape { biscuit, bread, flower1, flower2, hourglass1, hourglass2, stair, stamp, ticket, windmill }

const Map<DoomscrllMaskShape, String> _svgMaskPaths = {
  DoomscrllMaskShape.biscuit: "M1 0a1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0-1 1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0 1 1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0 1-1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1 1 1 0 0 0-1 1 1 1 0 0 0-1-1",
  DoomscrllMaskShape.bread: "M-20 20v6.2a6 6 0 0 0 1.3 3.8 6 6 0 0 0-1.3 3.7V40h6.2a6 6 0 0 0 3.8-1.3A6 6 0 0 0-6.2 40H0v-6.3A6 6 0 0 0-1.3 30 6 6 0 0 0 0 26.2V20h-6.2a6 6 0 0 0-3.8 1.3 6 6 0 0 0-3.8-1.3zM6.2 0A6.3 6.3 0 0 0 0 6.2V20h20V6.3A6.3 6.3 0 0 0 13.8 0 6 6 0 0 0 10 1.3 6 6 0 0 0 6.2 0",
  DoomscrllMaskShape.flower1: "M6.2 0A6.3 6.3 0 0 0 0 6.2 6 6 0 0 0 1.3 10 6 6 0 0 0 0 13.8 6.3 6.3 0 0 0 6.2 20a6 6 0 0 0 3.8-1.3 6 6 0 0 0 3.8 1.3 6.3 6.3 0 0 0 6.2-6.2 6 6 0 0 0-1.3-3.8A6 6 0 0 0 20 6.2 6.3 6.3 0 0 0 13.8 0 6 6 0 0 0 10 1.3 6 6 0 0 0 6.2 0",
  DoomscrllMaskShape.flower2: "M0 0v6.2A6 6 0 0 0 1.3 10 6 6 0 0 0 0 13.8V20h6.2a6 6 0 0 0 3.8-1.3 6 6 0 0 0 3.8 1.3H20v-6.2a6 6 0 0 0-1.3-3.8A6 6 0 0 0 20 6.2V0h-6.2A6 6 0 0 0 10 1.3 6 6 0 0 0 6.2 0Z",
  DoomscrllMaskShape.hourglass1: "M-20 20v6.2a6 6 0 0 0 1.3 3.8 6 6 0 0 0-1.3 3.7V40h6.2a6 6 0 0 0 3.8-1.3A6 6 0 0 0-6.2 40H0v-6.3A6 6 0 0 0-1.3 30 6 6 0 0 0 0 26.2V20h-6.2a6 6 0 0 0-3.8 1.3 6 6 0 0 0-3.8-1.3zM20 6.2A6 6 0 0 0 13.8 0H6.3A6 6 0 0 0 0 6.2 6 6 0 0 0 1.3 10 6 6 0 0 0 0 13.8 6 6 0 0 0 6.2 20h7.6a6 6 0 0 0 6.2-6.2 6 6 0 0 0-1.3-3.8A6 6 0 0 0 20 6.2",
  DoomscrllMaskShape.hourglass2: "M0 0v.91a5.45 5.45 0 0 0 2.438 4.545A5.45 5.45 0 0 0 0 10c0 1.897.966 3.568 2.436 4.545A5.45 5.45 0 0 0 0 19.091V20h20v-.91a5.45 5.45 0 0 0-2.438-4.545A5.45 5.45 0 0 0 20 10a5.45 5.45 0 0 0-2.438-4.545A5.45 5.45 0 0 0 20 .909V0H10Z",
  DoomscrllMaskShape.stair: "M4 0v4H0v16h16v-4h4V0Z",
  DoomscrllMaskShape.stamp: "M0 0v1l1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1v1h1l1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1h1v-1l-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1V0h-1l-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1-1 1-1-1Z",
  DoomscrllMaskShape.ticket:
      "M0 0v19l1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1 1 1 1-1V0H1Z",
  DoomscrllMaskShape.windmill: "M5 0a5 5 0 0 0-5 5v5h5.06-.12A5 5 0 0 0 0 15v5h10v-5a5 5 0 0 0 5 5 5 5 0 0 0 5-5v-5h-5.06.13A5 5 0 0 0 20 5V0H10v5a5 5 0 0 0-5-5",
};

const List<DoomscrllMaskShape> feedMaskShapes = [
  DoomscrllMaskShape.biscuit,
  DoomscrllMaskShape.bread,
  DoomscrllMaskShape.flower1,
  DoomscrllMaskShape.flower2,
  DoomscrllMaskShape.hourglass1,
  DoomscrllMaskShape.hourglass2,
  DoomscrllMaskShape.stair,
  DoomscrllMaskShape.stamp,
  DoomscrllMaskShape.windmill,
];

DoomscrllMaskShape getMaskShapeForIndex(int index) {
  return feedMaskShapes[index % feedMaskShapes.length];
}

class SvgPathProxy implements PathProxy {
  final Path path;
  SvgPathProxy(this.path);

  @override
  void moveTo(double x, double y) => path.moveTo(x, y);

  @override
  void lineTo(double x, double y) => path.lineTo(x, y);

  @override
  void cubicTo(double x1, double y1, double x2, double y2, double x3, double y3) {
    path.cubicTo(x1, y1, x2, y2, x3, y3);
  }

  @override
  void close() => path.close();
}

final Map<DoomscrllMaskShape, Path> _parsedMaskPaths = _svgMaskPaths.map((shape, svgString) {
  final path = Path();
  writeSvgPathDataToPath(svgString, SvgPathProxy(path));
  return MapEntry(shape, path);
});

class DoomscrllImageMaskClipper extends CustomClipper<Path> {
  final DoomscrllMaskShape shape;

  const DoomscrllImageMaskClipper(this.shape);

  @override
  Path getClip(Size size) {
    final basePath = _parsedMaskPaths[shape] ?? _parsedMaskPaths[DoomscrllMaskShape.biscuit]!;
    final scaleX = size.width / 20.0;
    final scaleY = size.height / 20.0;
    final matrix = Matrix4.identity()..scaleByDouble(scaleX, scaleY, 1.0, 1.0);
    return basePath.transform(matrix.storage);
  }

  @override
  bool shouldReclip(covariant DoomscrllImageMaskClipper oldClipper) => oldClipper.shape != shape;
}
