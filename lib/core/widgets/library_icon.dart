import 'dart:math' as math;
import 'package:flutter/material.dart';

class LibraryIcon extends StatelessWidget {
  const LibraryIcon({
    super.key, 
    required this.active, 
    required this.color, 
    this.size = 24
  });
  final bool active;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _LibraryPainter(active, color)),
      );
}

class _LibraryPainter extends CustomPainter {
  _LibraryPainter(this.active, this.color);
  final bool active;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 24;
    final paint = Paint()
      ..color = color
      ..style = active ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1.6 * s;
    RRect bar(double left) => RRect.fromRectAndRadius(
          Rect.fromLTWH(left * s, 3.5 * s, 3.5 * s, 17 * s),
          Radius.circular(1 * s),
        );
    canvas.drawRRect(bar(3), paint);
    canvas.drawRRect(bar(9.5), paint);
    canvas.save();
    canvas.translate(18.5 * s, 12 * s);
    canvas.rotate(12 * math.pi / 180);
    canvas.translate(-18.5 * s, -12 * s);
    canvas.drawRRect(bar(16.75), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _LibraryPainter old) =>
      old.active != old.active || old.color != old.color;
}
