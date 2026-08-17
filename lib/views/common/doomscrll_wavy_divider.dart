import "package:flutter/material.dart";

class DoomscrllWavyDivider extends StatelessWidget {
  final double height;
  final double waveWidth;
  final double strokeWidth;
  final Color? color;

  const DoomscrllWavyDivider({
    super.key,
    this.height = 12.0,
    this.waveWidth = 14.0,
    this.strokeWidth = 4.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _DoomscrllWavyDividerPainter(
          color: dividerColor,
          waveWidth: waveWidth,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class _DoomscrllWavyDividerPainter extends CustomPainter {
  final Color color;
  final double waveWidth;
  final double strokeWidth;

  const _DoomscrllWavyDividerPainter({
    required this.color,
    required this.waveWidth,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    final path = Path();
    final halfWave = waveWidth / 2;
    final midY = size.height / 2;
    double startX = 0.0;

    path.moveTo(0, midY);

    while (startX < size.width) {
      path.quadraticBezierTo(
        startX + halfWave / 2,
        0,
        startX + halfWave,
        midY,
      );
      path.quadraticBezierTo(
        startX + halfWave + halfWave / 2,
        size.height,
        startX + waveWidth,
        midY,
      );
      startX += waveWidth;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _DoomscrllWavyDividerPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.waveWidth != waveWidth ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
