import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MusicPlaceholder extends StatelessWidget {
  const MusicPlaceholder({
    super.key,
    required this.size,
    this.radius = 4,
    this.iconSize,
  });
  final double size;
  final double radius;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Icon(
          Icons.music_note,
          size: iconSize ?? size * 0.5,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
