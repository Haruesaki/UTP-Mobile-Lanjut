import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_dimens.dart';
import '../features/navigation/bottom_nav.dart';
import '../features/player/mini_player.dart';
import '../features/drawer/profile_drawer.dart';
import '../features/home/home_screen.dart';
import '../features/search/search_screen.dart';
import '../features/library/library_screen.dart';
import '../core/widgets/fade_indexed_stack.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _index = 0;

  void _openDrawer() => _scaffoldKey.currentState?.openDrawer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: const ProfileDrawer(),
      drawerScrimColor: AppColors.scrim,
      body: Stack(
        children: [
          FadeIndexedStack(
            index: _index,
            children: [
              HomeScreen(onAvatarTap: _openDrawer),
              SearchScreen(onAvatarTap: _openDrawer),
              LibraryScreen(onAvatarTap: _openDrawer),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const MiniPlayer(),
                BottomNav(
                  currentIndex: _index,
                  onTabSelected: (i) => setState(() => _index = i),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
