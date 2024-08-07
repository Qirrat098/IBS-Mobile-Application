import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final Color color;
  final double width;

  CustomTabIndicator({required this.color, this.width = 50.0});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(color: color, width: width);
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final Color color;
  final double width;

  _CustomTabIndicatorPainter({required this.color, required this.width});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Custom width and positioning
    final double indicatorWidth = width;
    final double indicatorHeight = 5.0; // Height of the indicator

    final Rect indicatorRect = Rect.fromLTWH(
      rect.left + (rect.width - indicatorWidth) / 2,
      rect.bottom - indicatorHeight,
      indicatorWidth,
      indicatorHeight,
    );

    canvas.drawRect(indicatorRect, paint);
  }
}
