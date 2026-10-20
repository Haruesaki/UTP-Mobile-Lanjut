import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_dimens.dart';
import '../../core/widgets/app_avatar.dart';
import '../../core/widgets/filter_chip_pill.dart';
import '../../core/widgets/section_title.dart';
import 'widgets/shortcut_tile.dart';
import 'widgets/track_row.dart';
import 'widgets/station_card.dart';
import 'widgets/recents_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onAvatarTap,
  });

  final VoidCallback onAvatarTap;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double shortcutTileWidth = (screenWidth - 32 - 8) / 2;
    final double bottomChrome = AppDimens.bottomChrome(context);

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          top: AppDimens.headerTopGap,
          bottom: bottomChrome + 16,
          left: AppDimens.pageMargin,
          right: AppDimens.pageMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                GestureDetector(
                  key: const Key('home_avatar'),
                  onTap: onAvatarTap,
                  child: const AppAvatar(size: 32),
                ),
                const SizedBox(width: 12),
                FilterChipPill(
                  key: const Key('home_chip_all'),
                  label: 'All',
                  selected: true,
                  horizontalPadding: 16,
                ),
                const SizedBox(width: 8),
                FilterChipPill(
                  label: 'Music',
                  selected: false,
                  horizontalPadding: 16,
                ),
                const SizedBox(width: 8),
                FilterChipPill(
                  label: 'Podcasts',
                  selected: false,
                  horizontalPadding: 16,
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Shortcut Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: shortcutTileWidth / 48,
              children: [
                ShortcutTile(
                  key: const Key('home_shortcut_tile_0'),
                  title: 'Shizue',
                  showEqualizer: true,
                ),
                ShortcutTile(
                  key: const Key('home_shortcut_tile_1'),
                  title: 'Alay',
                ),
                ShortcutTile(
                  key: const Key('home_shortcut_tile_2'),
                  title: 'bittersweet',
                ),
                ShortcutTile(
                  title: 'Silence',
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Your recent rotation
            const SectionTitle('Your recent rotation'),
            const TrackRow(title: 'Take A Chance With Me', subtitle: 'NIKI'),
            const TrackRow(title: 'bittersweet', subtitle: 'Madison Beer'),
            const TrackRow(title: 'Love Me Harder', subtitle: 'Ariana Grande, The Weeknd'),
            const SizedBox(height: 26),
            
            // Recommended Stations
            const SectionTitle('Recommended Stations'),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 0), // Handled by Home screen padding
                children: [
                  StationCard(
                    key: const Key('home_station_card_0'),
                    artistName: 'G-Eazy',
                    backgroundColor: AppColors.stationCoral,
                  ),
                  const SizedBox(width: 16),
                  StationCard(
                    key: const Key('home_station_card_1'),
                    artistName: 'Justin Bieber',
                    backgroundColor: AppColors.stationMint,
                  ),
                  const SizedBox(width: 16),
                  StationCard(
                    artistName: 'The Weeknd',
                    backgroundColor: AppColors.stationPink,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 76),
            
            // Recents
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionTitle('Recents'),
                Text(
                  'Show all',
                  style: AppTextStyles.button13.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
            SizedBox(
              height: 120, // Enough for thumbnail + text
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                children: [
                  RecentsTile(title: 'Shizue'),
                  const SizedBox(width: 16),
                  RecentsTile(title: 'Alay'),
                  const SizedBox(width: 16),
                  RecentsTile(title: 'Cheer'),
                  const SizedBox(width: 16),
                  RecentsTile(title: '09.00PM-03.00AM'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
