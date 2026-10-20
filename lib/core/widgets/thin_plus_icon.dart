import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ThinPlusIcon extends StatelessWidget {
  const ThinPlusIcon({
    super.key,
    this.size = 22,
    this.strokeWidth = 2,
    this.color = AppColors.textPrimary,
  });
  final double size;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _PlusPainter(strokeWidth, color)),
      );
}

class _PlusPainter extends CustomPainter {
  _PlusPainter(this.strokeWidth, this.color);
  final double strokeWidth;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final c = size.center(Offset.zero);
    final h = size.width / 2 - strokeWidth / 2;
    canvas.drawLine(Offset(c.dx - h, c.dy), Offset(c.dx + h, c.dy), paint);
    canvas.drawLine(Offset(c.dx, c.dy - h), Offset(c.dx, c.dy + h), paint);
  }

  @override
  bool shouldRepaint(covariant _PlusPainter old) =>
      old.strokeWidth != old.strokeWidth || old.color != old.color;
}
