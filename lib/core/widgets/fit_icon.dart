import 'package:flutter/material.dart';

class FitIcon extends StatelessWidget {
  const FitIcon(this.icon, {
    super.key, 
    required this.box, 
    required this.glyph, 
    required this.color
  });
  final IconData icon;
  final double box;
  final double glyph;
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: box,
        height: box,
        child: OverflowBox(
          maxWidth: glyph,
          maxHeight: glyph,
          child: Icon(icon, size: glyph, color: color),
        ),
      );
}
