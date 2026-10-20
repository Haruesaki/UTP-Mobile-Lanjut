import 'package:flutter/material.dart';
import '../../core/widgets/app_avatar.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_dimens.dart';
import 'widgets/search_field.dart';
import 'widgets/category_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.onAvatarTap});

  final VoidCallback onAvatarTap;

  static const double headerTopGap = 12;

  static const List<(String, Color)> _tiles = [
    ('Music', AppColors.catMusic),
    ('Podcasts', AppColors.catPodcasts),
    ('Live Events', AppColors.catLive),
    ('K-Pop ON!\n(온) Hub', AppColors.catKpop),
    ('Made For\nYou', AppColors.catMadeForYou),
    ('Upcom-\ning Rel…', AppColors.browseUpcoming),
    ('New\nReleas…', AppColors.browseNewReleases),
    ('Pop', AppColors.browsePop),
    ('Indie', AppColors.browseIndie),
    ('Musik\nIndon…', AppColors.browseMusikIndonesia),
    ('K-pop', AppColors.browseKpop),
    ('Charts', AppColors.browseCharts),
    ('Podcast\nCharts', AppColors.browsePodcastCharts),
    ('Podcast\nNew R…', AppColors.browsePodcastNewReleases),
    ('Video\nPodcast', AppColors.browseVideoPodcast),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.only(top: AppDimens.topInset(context)),
        child: ListView(
          padding: const EdgeInsets.only(top: headerTopGap),
          children: [
            _buildHeader(context),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SearchField(),
            ),
            const SizedBox(height: 16),
            _buildGrid(),
            SizedBox(height: AppDimens.bottomChrome(context) + 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
                key: const Key('search_avatar'),
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                'Search',
                key: Key('search_title'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.display24,
              ),
            ),
            const Icon(
              Icons.photo_camera_outlined,
              key: Key('search_camera'),
              size: 28,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 68,
        ),
        itemCount: _tiles.length,
        itemBuilder: (context, index) => CategoryTile(
          key: Key('search_tile_$index'),
          title: _tiles[index].$1,
          color: _tiles[index].$2,
        ),
      ),
    );
  }
}
