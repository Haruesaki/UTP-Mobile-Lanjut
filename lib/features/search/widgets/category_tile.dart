import 'package:flutter/material.dart';
import 'dart:math';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            left: 8,
            top: 8,
            width: 100,
            child: Text(
              title,
              style: AppTextStyles.bodyBold16,
              maxLines: 2,
              overflow: TextOverflow.clip,
            ),
          ),
          Positioned(
            right: -14,
            bottom: -26,
            width: 72,
            height: 72,
            child: Transform.rotate(
              angle: 25 * pi / 180,
              child: CategoryArtPlaceholder(),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryArtPlaceholder extends StatelessWidget {
  const CategoryArtPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
    );
  }
}
