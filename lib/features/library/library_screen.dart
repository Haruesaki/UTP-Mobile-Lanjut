import 'package:flutter/material.dart';
import '../../core/theme/app_dimens.dart';
import 'widgets/library_header.dart';
import 'widgets/sort_row.dart';
import 'widgets/library_item_row.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({
    super.key,
    required this.onAvatarTap,
  });

  final VoidCallback onAvatarTap;

    @override
  Widget build(BuildContext context) {
    final double bottomChrome = AppDimens.bottomChrome(context);

    return Padding(
      padding: EdgeInsets.only(top: AppDimens.topInset(context)),
      child: Column(
        children: [
          LibraryHeader(onAvatarTap: onAvatarTap),
          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(
                top: 13,
                bottom: bottomChrome + 16,
              ),
              children: [
                const SortRow(),
                LibraryItemRow(
                  key: const Key('library_item_row_0'),
                  title: 'Shizue',
                  subtitle: 'Playlist • Haruki',
                  isActive: true,
                  isPinned: true,
                ),
                LibraryItemRow(
                  title: 'Alay',
                  subtitle: 'Playlist • Haruki',
                ),
                LibraryItemRow(
                  title: 'Cheer',
                  subtitle: 'Playlist • Haruki',
                ),
                LibraryItemRow(
                  title: '09.00PM-03.00AM',
                  subtitle: 'Playlist • Haruki',
                ),
                LibraryItemRow(
                  title: '~',
                  subtitle: 'Playlist • Haruki',
                ),
                LibraryItemRow(
                  title: 'Liked Songs',
                  subtitle: 'Playlist • 306 songs',
                  isLikedSongs: true,
                ),
                LibraryItemRow(
                  title: 'Night Drive',
                  subtitle: 'Playlist • Haruki',
                ),
                LibraryItemRow(
                  title: 'Your Episodes',
                  subtitle: 'Playlist • Saved & downloaded episodes',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}