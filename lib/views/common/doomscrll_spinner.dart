import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_svg/flutter_svg.dart";

import "package:doomscrll_app_audience/theme/app_colors.dart";

class DoomscrllSpinner extends StatefulWidget {
  final double size;
  final Color color;
  final String? label;
  final bool hasBlendMode;
  final bool hasBackdrop;
  final Color? backdropColor;

  const DoomscrllSpinner({
    super.key,
    this.size = 96.0,
    this.color = AppColors.bloodmoon,
    this.label,
    this.hasBlendMode = false,
    this.hasBackdrop = false,
    this.backdropColor,
  });

  @override
  State<DoomscrllSpinner> createState() => _DoomscrllSpinnerState();
}

class _DoomscrllSpinnerState extends State<DoomscrllSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const String _frameSvg =
      '<svg viewBox="0 0 24 24"><path d="M2 2v20h20V2H3Zm1 1h18v18H3V4.9Z"/></svg>';

  static const String _ooSvg =
      '<svg viewBox="0 0 24 24"><path d="M3.36 4.89 3 4.9q-.55.05-1 .24-.54.23-.95.65-.84.92-1.01 2.52T.44 12Q.98 14.07 2 15.67l.01.02q.47.71.99 1.3.65.7 1.38 1.22 1.33.9 2.8.9l-.07-.2q-.6-.01-1.33-.86-.72-.86-1.43-2.4A24 24 0 0 1 3.1 12l-.1-.35a20 20 0 0 1-.6-3.3 7 7 0 0 1 .14-2.4q.16-.52.46-.72a1 1 0 0 1 .42-.13zm7.44 0q-1.47 0-2.56.9a6 6 0 0 0-1.68 2.52q-.6 1.6-.6 3.69t.6 3.7 1.68 2.5q1.1.91 2.56.91v-.2q-.6-.01-1.11-.86a8 8 0 0 1-.79-2.4A21 21 0 0 1 8.62 12q0-2.13.28-3.65.3-1.54.79-2.4t1.1-.85zm2.41 0v.2q.6.01 1.08.86.5.85.79 2.4.3 1.52.3 3.65 0 2.1-.3 3.65a7 7 0 0 1-.79 2.4q-.48.85-1.08.85v.21q1.44 0 2.53-.9 1.1-.91 1.7-2.52t.6-3.69-.6-3.7a6 6 0 0 0-1.7-2.5q-1.09-.91-2.53-.91m3.63 0 .05.2q.6.01 1.31.86.74.85 1.43 2.4.7 1.52 1.28 3.65l.09.37q.48 1.88.59 3.28a6 6 0 0 1-.14 2.4q-.16.52-.45.72a1 1 0 0 1-.4.13l.05.21.35-.01q.55-.04 1-.24.53-.23.93-.65.85-.91 1.03-2.52.17-1.6-.39-3.69-.54-2.07-1.57-3.66l-.02-.03A10 10 0 0 0 21 7.02q-.65-.72-1.4-1.23-1.32-.9-2.76-.9"/></svg>';

  static const String _starSvg =
      '<svg viewBox="0 0 24 24"><path d="m12 10.11-.29 1.2-1.04-.64.64 1.04-1.2.29 1.2.29-.64 1.04 1.04-.63.3 1.19.28-1.2 1.05.64-.64-1.04 1.2-.29-1.2-.29.64-1.04-1.05.63z"/></svg>';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSvg(String svgString) {
    return SvgPicture.string(
      svgString,
      width: widget.size,
      height: widget.size,
      allowDrawingOutsideViewBox: true,
      clipBehavior: Clip.none,
      colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counterAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller);

    Widget ooWidget = _buildSvg(_ooSvg);
    if (widget.hasBlendMode) {
      ooWidget = _BlendMask(
        blendMode: BlendMode.difference,
        child: ooWidget,
      );
    }

    Widget content = SizedBox(
      width: widget.size,
      height: widget.size,
      child: _BlendGroup(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            RotationTransition(turns: _controller, child: _buildSvg(_frameSvg)),
            ooWidget,
            RotationTransition(
              turns: counterAnimation,
              child: _buildSvg(_starSvg),
            ),
          ],
        ),
      ),
    );

    if (widget.label != null) {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          content,
          const SizedBox(height: 16),
          Text(
            widget.label!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(color: widget.color),
          ),
        ],
      );
    }

    if (widget.hasBackdrop) {
      content = _Backdrop(
        color: widget.backdropColor,
        child: content,
      );
    }

    return content;
  }
}

class _BlendGroup extends SingleChildRenderObjectWidget {
  const _BlendGroup({required super.child});

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderBlendGroup();
}

class _RenderBlendGroup extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    final Rect rect = offset & size;
    context.canvas.saveLayer(rect, Paint());
    super.paint(context, offset);
    context.canvas.restore();
  }
}

class _BlendMask extends SingleChildRenderObjectWidget {
  final BlendMode blendMode;

  const _BlendMask({
    required this.blendMode,
    required super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderBlendMask(blendMode);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderBlendMask renderObject) {
    renderObject.blendMode = blendMode;
  }
}

class _RenderBlendMask extends RenderProxyBox {
  BlendMode _blendMode;

  _RenderBlendMask(this._blendMode);

  set blendMode(BlendMode value) {
    if (_blendMode == value) return;
    _blendMode = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Rect rect = offset & size;
    context.canvas.saveLayer(rect, Paint()..blendMode = _blendMode);
    super.paint(context, offset);
    context.canvas.restore();
  }
}

class _Backdrop extends StatelessWidget {
  final Color? color;
  final Widget child;

  const _Backdrop({
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color ?? AppColors.darkness.withValues(alpha: 0.75),
      alignment: Alignment.center,
      child: child,
    );
  }
}
