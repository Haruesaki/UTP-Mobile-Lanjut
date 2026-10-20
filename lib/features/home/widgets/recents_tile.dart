import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/music_placeholder.dart';

class RecentsTile extends StatelessWidget {
  const RecentsTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MusicPlaceholder(size: 94, radius: 4),
        const SizedBox(height: 8),
        SizedBox(
          width: 94,
          child: Text(
            title,
            style: AppTextStyles.bodyBold14,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

