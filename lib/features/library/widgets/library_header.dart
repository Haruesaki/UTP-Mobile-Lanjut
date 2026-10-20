import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_avatar.dart';

class LibraryHeader extends StatelessWidget {
  const LibraryHeader({super.key, required this.onAvatarTap});

  final VoidCallback onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 32,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onAvatarTap,
              child: AppAvatar(
                key: Key('library_avatar'),
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                'Your Library',
                key: Key('library_title'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.display24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}