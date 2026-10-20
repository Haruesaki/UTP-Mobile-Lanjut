import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_dimens.dart';
import '../../core/widgets/app_avatar.dart';
import '../../core/widgets/thin_plus_icon.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('drawer_panel'),
      width: MediaQuery.of(context).size.width * 0.9,
      backgroundColor: AppColors.drawer,
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      surfaceTintColor: Colors.transparent,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: AppDimens.topInset(context) + 12,
                    left: 16,
                  ),
                  child: Row(
                    children: [
                      const AppAvatar(
                        key: Key('drawer_avatar'),
                        size: 48,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Haruki',
                            style: AppTextStyles.title20.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'View profile',
                            style: AppTextStyles.caption13.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 1,
                  color: AppColors.divider,
                  width: double.infinity,
                ),
                _buildMenuItem(key: const Key('drawer_item_0'), icon: const ThinPlusIcon(size: 22), label: 'Add account'),
                _buildMenuItem(icon: const Icon(Icons.flash_on_outlined, size: 26, color: Colors.white), label: "What's new"),
                _buildMenuItem(icon: const Icon(Icons.history, size: 26, color: Colors.white), label: 'Recents'),
                _buildMenuItem(icon: const Icon(Icons.campaign_outlined, size: 26, color: Colors.white), label: 'Your Updates'),
                _buildMenuItem(key: const Key('drawer_item_4'), icon: const Icon(Icons.settings_outlined, size: 28, color: Colors.white), label: 'Settings and privacy'),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 28,
                        child: Text(
                          'Messages',
                          style: AppTextStyles.title20.copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        height: 18,
                        child: Text(
                          'Share what you love with friends, right on Spotify.',
                          style: AppTextStyles.caption13.copyWith(color: AppColors.textSecondary),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 48,
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFF333333),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit_square, 
                                size: 24, 
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'New message',
                              style: AppTextStyles.bodyBold14.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: AppDimens.bottomInset(context),
            child: Container(
              height: 1,
              color: const Color(0xFF2E2E2E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    Key? key, 
    required Widget icon, 
    required String label,
  }) {
    return Container(
      key: key,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Center(child: icon),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: AppTextStyles.body16.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
