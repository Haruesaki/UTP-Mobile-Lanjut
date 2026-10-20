import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/music_placeholder.dart';

class LibraryItemRow extends StatelessWidget {
  const LibraryItemRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.isLikedSongs = false,
    this.isActive = false,
    this.isPinned = false,
  });

  final String title;
  final String subtitle;
  final bool isLikedSongs;
  final bool isActive;
  final bool isPinned;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              _buildCover(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.body16.copyWith(
                        color: isActive ? AppColors.green : Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (isPinned)
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Transform.rotate(
                              angle: math.pi / 4,
                              child: const Icon(Icons.push_pin, size: 14, color: AppColors.green),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            subtitle,
                            style: AppTextStyles.caption13.copyWith(color: AppColors.textSecondary),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCover() {
    if (isLikedSongs) {
      return Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.likedGradientStart, AppColors.likedGradientEnd],
          ),
        ),
        child: const Center(
          child: Icon(Icons.favorite, color: Colors.white, size: 28),
        ),
      );
    }
    return MusicPlaceholder(size: 64, radius: 4);
  }
}
