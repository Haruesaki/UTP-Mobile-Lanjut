import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_dimens.dart';
import '../../core/widgets/music_placeholder.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('mini_player'),
      width: MediaQuery.of(context).size.width - 16,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.miniPlayer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                const MusicPlaceholder(size: 40, radius: 4),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Obsessed',
                        style: AppTextStyles.bodyBold14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Mariah Carey',
                        style: AppTextStyles.caption13.copyWith(color: AppColors.miniPlayerSubtitle),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                _PlayerControl(icon: Icons.speaker_group_outlined),
                _PlayerControl(
                  icon: null,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
                    child: const Icon(Icons.check, size: 16, color: Color(0xFF121212)),
                  ),
                ),
                _PlayerControl(icon: Icons.play_arrow_rounded, iconSize: 32),
              ],
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 1,
            child: SizedBox(
              height: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: LinearProgressIndicator(
                  value: 0.23,
                  backgroundColor: AppColors.miniPlayerTrack,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerControl extends StatelessWidget {
  const _PlayerControl({this.icon, this.child, this.iconSize = 24});
  final IconData? icon;
  final Widget? child;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 41,
      height: double.infinity,
      child: Center(
        child: child ?? Icon(icon, size: iconSize, color: Colors.white),
      ),
    );
  }
}

