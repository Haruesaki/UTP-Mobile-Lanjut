
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utp_mobile_spotify/app/app.dart';
import 'package:utp_mobile_spotify/features/search/search_screen.dart';

void main() {
  testWidgets('Diagnosis Grid Search - T-02 and T-03', (tester) async {
    tester.view.physicalSize = const Size(1125, 2502); // 375 x 834 at DPR 3.0
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const SpotifyApp());
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();

    // Measurement values
    final fieldBottom = tester.getBottomLeft(find.byKey(const Key('search_field'))).dy;
    final tile0Top = tester.getTopLeft(find.byKey(const Key('search_category_tile_0'))).dy;
    
    final tile0Size = tester.getSize(find.byKey(const Key('search_category_tile_0')));
    final browse0Size = tester.getSize(find.byKey(const Key('search_browse_tile_0')));
    
    final tile4Bottom = tester.getBottomLeft(find.byKey(const Key('search_category_tile_4'))).dy;
    final browse0Top = tester.getTopLeft(find.byKey(const Key('search_browse_tile_0'))).dy;

    print('--- DIAGNOSIS RESULTS ---');
    print('Bottom of search_field: $fieldBottom');
    print('Top of search_category_tile_0: $tile0Top');
    print('T-02 Gap (field -> tile 0): ${tile0Top - fieldBottom}');
    print('Size of search_category_tile_0: ${tile0Size.width} x ${tile0Size.height}');
    print('Size of search_browse_tile_0: ${browse0Size.width} x ${browse0Size.height}');
    print('Bottom of search_category_tile_4: $tile4Bottom');
    print('Top of search_browse_tile_0: $browse0Top');
    print('T-03 Gap (tile 4 -> browse 0): ${browse0Top - tile4Bottom}');
    print('------------------------');
  });
}
