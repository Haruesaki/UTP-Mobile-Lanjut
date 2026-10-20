import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key, 
    required this.size, 
    this.onTap,
  });
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Semantics(
        label: 'Buka menu profil',
        button: true,
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: AppColors.avatarBg,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.person,
              size: size * 0.6,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
