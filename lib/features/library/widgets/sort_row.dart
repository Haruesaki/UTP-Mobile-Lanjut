import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class SortRow extends StatelessWidget {
  const SortRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 32,
        child: Row(
          children: [
            Transform.flip(
              flipX: true,
              child: const Icon(Icons.swap_vert, size: 24, color: Colors.white),
            ),
            const SizedBox(width: 5),
            Text(
              'Recents',
              style: AppTextStyles.bodyBold14.copyWith(color: Colors.white),
            ),
            const Spacer(),
            const Icon(Icons.grid_view_outlined, size: 20, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
