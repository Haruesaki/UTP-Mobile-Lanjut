import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_dimens.dart';
import '../../core/widgets/library_icon.dart';
import '../../core/widgets/thin_plus_icon.dart';
import '../../core/widgets/fit_icon.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double itemWidth = width / 5;

    return ColoredBox(
      key: const Key('bottom_nav_background'),
      color: AppColors.navBackground,
      child: SizedBox(
        height: AppDimens.navContentHeight + AppDimens.bottomInset(context),
        child: Row(
          children: [
            _NavItem(
              label: 'Home',
              icon: Icon(currentIndex == 0 ? Icons.home_filled : Icons.home_outlined, color: currentIndex == 0 ? AppColors.textPrimary : AppColors.textSecondary),
              isActive: currentIndex == 0,
              onTap: () => onTabSelected(0),
              width: itemWidth,
            ),
            _NavItem(
              label: 'Search',
              icon: FitIcon(
                Icons.search,
                box: 24,
                glyph: 28,
                color: currentIndex == 1 ? AppColors.textPrimary : AppColors.textSecondary,
              ),
              isActive: currentIndex == 1,
              onTap: () => onTabSelected(1),
              width: itemWidth,
            ),
            _NavItem(
              label: 'Your Library',
              icon: LibraryIcon(
                active: currentIndex == 2,
                color: currentIndex == 2 ? AppColors.textPrimary : AppColors.textSecondary,
              ),
              isActive: currentIndex == 2,
              onTap: () => onTabSelected(2),
              width: itemWidth,
            ),
            _NavItem(
              label: 'Premium',
              icon: Icon(Icons.star, color: AppColors.textSecondary),
              isActive: false,
              onTap: null,
              width: itemWidth,
            ),
            _NavItem(
              label: 'Create',
              icon: const ThinPlusIcon(size: 22),
              isActive: false,
              onTap: null,
              width: itemWidth,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.isActive,
    this.onTap,
    required this.width,
  });

  final String label;
  final Widget icon;
  final bool isActive;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Center(child: icon),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.nav11.copyWith(
                color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
