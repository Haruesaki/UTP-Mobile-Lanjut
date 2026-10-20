import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MockData {
  static const List<Map<String, dynamic>> shortcutTiles = [
    {'title': 'Shizue', 'eq': true},
    {'title': 'Alay', 'eq': false},
    {'title': 'bittersweet', 'eq': false},
    {'title': 'Silence', 'eq': false},
  ];

  static const List<Map<String, String>> recentRotation = [
    {'title': 'Take A Chance With Me', 'subtitle': 'NIKI'},
    {'title': 'bittersweet', 'subtitle': 'Madison Beer'},
    {'title': 'Love Me Harder', 'subtitle': 'Ariana Grande, The Weeknd'},
  ];

  static const List<Map<String, dynamic>> recommendedStations = [
    {'name': 'G-Eazy', 'color': AppColors.stationCoral},
    {'name': 'Justin Bieber', 'color': AppColors.stationMint},
    {'name': 'The Weeknd', 'color': AppColors.stationPink},
  ];

  static const List<Map<String, dynamic>> categories = [
    {'title': 'Music', 'color': AppColors.catMusic},
    {'title': 'Podcasts', 'color': AppColors.catPodcasts},
    {'title': 'Live Events', 'color': AppColors.catLive},
    {'title': 'K-Pop ON!\n(온) Hub', 'color': AppColors.catKpop},
    {'title': 'Made For\nYou', 'color': AppColors.catMadeForYou},
  ];

  static const List<Map<String, String>> libraryItems = [
    {'title': 'Shizue', 'subtitle': 'Playlist • Haruki', 'active': 'true'},
    {'title': 'Alay', 'subtitle': 'Playlist • Haruki', 'active': 'false'},
    {'title': 'Cheer', 'subtitle': 'Playlist • Haruki', 'active': 'false'},
    {'title': '09.00PM-03.00AM', 'subtitle': 'Playlist • Haruki', 'active': 'false'},
    {'title': '~', 'subtitle': 'Playlist • Haruki', 'active': 'false'},
    {'title': 'Liked Songs', 'subtitle': 'Playlist • 306 songs', 'active': 'false'},
    {'title': 'Night Drive', 'subtitle': 'Playlist • Haruki', 'active': 'false'},
    {'title': 'Your Episodes', 'subtitle': 'Playlist • Saved & downloaded episodes', 'active': 'false'},
  ];

  static const String miniPlayerTitle = 'Obsessed';
  static const String miniPlayerArtist = 'Mariah Carey';
  static const double miniPlayerProgress = 0.23;

  static const String profileName = 'Haruki';
  static const String profileSubtext = 'View profile';
  static const List<String> drawerMenu = [
    'Add account',
    'What\'s new',
    'Recents',
    'Your Updates',
    'Settings and privacy',
  ];
  static const String messagesTitle = 'Messages';
  static const String messagesDesc = 'Share what you love with friends, right on Spotify.';
  static const String newMessageLabel = 'New message';
}
