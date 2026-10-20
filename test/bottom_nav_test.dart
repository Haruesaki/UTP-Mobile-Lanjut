
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utp_mobile_spotify/app/app.dart';
import 'package:utp_mobile_spotify/core/theme/app_colors.dart';

void main() {
  testWidgets('bottom nav background is solid and correct color', (tester) async {
    tester.view.physicalSize = const Size(1125, 2502);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);
    
    await tester.pumpWidget(const SpotifyApp());
    
    final ColoredBox bg = tester.widget<ColoredBox>(find.byKey(const Key('bottom_nav_background')));
    
    expect(bg.color, AppColors.navBackground);
    expect(bg.color.a, 1.0);
  });
}
