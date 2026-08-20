import "package:doomscrll_app_audience/theme/app_colors.dart";
import "package:doomscrll_app_audience/views/common/doomscrll_spinner.dart";
import "package:flutter/material.dart";

class DoomscrllRefreshIndicator extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  final double refreshThreshold;

  const DoomscrllRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
    this.refreshThreshold = 70.0,
  });

  @override
  State<DoomscrllRefreshIndicator> createState() =>
      _DoomscrllRefreshIndicatorState();
}

class _DoomscrllRefreshIndicatorState extends State<DoomscrllRefreshIndicator> {
  double _dragOffset = 0.0;
  bool _isRefreshing = false;

  void _handleScrollNotification(ScrollNotification notification) {
    if (_isRefreshing) return;
    if (notification.metrics.axis != Axis.vertical) return;

    if (notification is OverscrollNotification && notification.overscroll < 0) {
      setState(() {
        _dragOffset = (_dragOffset - notification.overscroll).clamp(
          0.0,
          widget.refreshThreshold * 1.5,
        );
      });
    } else if (notification is ScrollUpdateNotification) {
      if (notification.scrollDelta != null &&
          notification.scrollDelta! > 0 &&
          _dragOffset > 0) {
        setState(() {
          _dragOffset = (_dragOffset - notification.scrollDelta!).clamp(
            0.0,
            widget.refreshThreshold * 1.5,
          );
        });
      }
    } else if (notification is ScrollEndNotification) {
      if (_dragOffset >= widget.refreshThreshold) {
        _startRefresh();
      } else {
        setState(() {
          _dragOffset = 0.0;
        });
      }
    }
  }

  Future<void> _startRefresh() async {
    setState(() {
      _isRefreshing = true;
      _dragOffset = widget.refreshThreshold;
    });

    try {
      await widget.onRefresh();
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshing = false;
          _dragOffset = 0.0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_dragOffset / widget.refreshThreshold).clamp(0.0, 1.0);
    final topOffset = (_dragOffset.clamp(0.0, widget.refreshThreshold) - 44.0)
        .clamp(-44.0, 16.0);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _handleScrollNotification(notification);
        return false;
      },
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(
              0.0,
              _dragOffset.clamp(0.0, widget.refreshThreshold),
            ),
            child: widget.child,
          ),
          if (_dragOffset > 0 || _isRefreshing)
            Positioned(
              top: topOffset,
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: progress,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: AppColors.darkness,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const DoomscrllSpinner(size: 36.0),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
