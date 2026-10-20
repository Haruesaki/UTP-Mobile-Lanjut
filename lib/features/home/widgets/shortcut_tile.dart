import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/music_placeholder.dart';

class ShortcutTile extends StatelessWidget {
  const ShortcutTile({
    super.key,
    required this.title,
    this.showEqualizer = false,
  });

  final String title;
  final bool showEqualizer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Row(
            children: [
              MusicPlaceholder(size: 48, radius: 4),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bodyBold14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (showEqualizer)
            Positioned(
              right: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: SizedBox(
                  width: 12,
                  height: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _EqualizerDot(),
                      const SizedBox(height: 1),
                      _EqualizerDot(),
                      const SizedBox(height: 1),
                      _EqualizerDot(),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _EqualizerDot extends StatelessWidget {
  const _EqualizerDot();
  @override
  Widget build(BuildContext context) => 
    Container(width: 3, height: 3, color: AppColors.green);
}

