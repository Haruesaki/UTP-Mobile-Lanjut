import 'package:flutter/material.dart';
import "package:utp_mobile_spotify/core/theme/app_fonts.dart";
import 'app_shell.dart';
import '../core/theme/app_colors.dart';
import '../core/widgets/app_frame.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify UI',
      theme: ThemeData(fontFamily: AppFonts.family, useMaterial3: true,
        brightness: Brightness.dark,

        scaffoldBackgroundColor: AppColors.background,
        splashFactory: NoSplash.splashFactory,
      ),
      builder: (context, child) {
        final mq = MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling);
        return MediaQuery(
          data: mq, 
          child: AppFrame(child: child!)
        );
      },
      home: const AppShell(),
    );
  }
}