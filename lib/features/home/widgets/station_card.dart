import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class StationCard extends StatelessWidget {
  const StationCard({
    super.key,
    required this.artistName,
    required this.backgroundColor,
  });

  final String artistName;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            left: 6,
            top: 5,
            child: Icon(Icons.music_note, size: 12, color: AppColors.stationText),
          ),
          Positioned(
            right: 6,
            top: 4,
            child: Text('RADIO', style: AppTextStyles.radio10.copyWith(color: AppColors.stationText)),
          ),
          _CircularPlaceholder(
            diameter: 56,
            center: const Offset(21, 65),
            color: const Color(0x40000000),
            iconColor: Colors.white.withOpacity(0.7),
          ),
          _CircularPlaceholder(
            diameter: 56,
            center: const Offset(129, 65),
            color: const Color(0x40000000),
            iconColor: Colors.white.withOpacity(0.7),
          ),
          _CircularPlaceholder(
            diameter: 78,
            center: const Offset(75, 65),
            color: const Color(0x1E1E1E),
            iconColor: AppColors.textSecondary,
            iconSize: 32,
          ),
          Positioned(
            left: 6,
            right: 6,
            bottom: 6,
            child: Text(
              artistName,
              style: AppTextStyles.stationName22.copyWith(color: AppColors.stationText),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircularPlaceholder extends StatelessWidget {
  const _CircularPlaceholder({
    required this.diameter,
    required this.center,
    required this.color,
    required this.iconColor,
    this.iconSize = 22,
  });

  final double diameter;
  final Offset center;
  final Color color;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: center.dx - diameter / 2,
      top: center.dy - diameter / 2,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(Icons.music_note, size: iconSize, color: iconColor),
        ),
      ),
    );
  }
}

