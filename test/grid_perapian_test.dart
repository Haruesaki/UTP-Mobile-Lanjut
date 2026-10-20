
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utp_mobile_spotify/app/app.dart';
import 'package:utp_mobile_spotify/features/search/search_screen.dart';

void main() {
  testWidgets('grid Search: satu ukuran, rapat, tanpa slot kosong', (tester) async {
    tester.view.physicalSize = const Size(1125, 2502); // 375 x 834 at DPR 3.0
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const SpotifyApp());
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();

    final topInset = 40.0;
    final g = SearchScreen.headerTopGap;
    final gridTop = topInset + g + 128;

    for (var i = 0; i < 15; i++) {
      final finder = find.byKey(Key('search_tile_$i'));
      expect(finder, findsOneWidget, reason: 'tile $i');
      final topLeft = tester.getTopLeft(finder);
      final size = tester.getSize(finder);
      expect(size.width, closeTo(163.5, 1), reason: 'lebar tile $i');
      expect(size.height, closeTo(68, 1), reason: 'tinggi tile $i');
      expect(topLeft.dx, closeTo(i.isEven ? 16 : 195.5, 1), reason: 'x tile $i');
      expect(topLeft.dy, closeTo(gridTop + (i ~/ 2) * 84, 1), reason: 'y tile $i');
    }

    expect(find.byKey(const Key('search_browse_tile_0')), findsNothing);
    expect(find.byKey(const Key('search_category_tile_0')), findsNothing);

    final fieldBottom = tester.getBottomLeft(find.byKey(const Key('search_field'))).dy;
    final firstTileTop = tester.getTopLeft(find.byKey(const Key('search_tile_0'))).dy;
    expect(firstTileTop - fieldBottom, closeTo(16, 1));

    for (var row = 0; row < 7; row++) {
      final a = tester.getBottomLeft(find.byKey(Key('search_tile_${row * 2}'))).dy;
      final b = tester.getTopLeft(find.byKey(Key('search_tile_${row * 2 + 2}'))).dy;
      expect(b - a, closeTo(16, 1), reason: 'jarak baris $row ke ${row + 1}');
    }
  });
}
