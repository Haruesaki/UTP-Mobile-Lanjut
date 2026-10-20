
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utp_mobile_spotify/app/app.dart';

Future<void> _pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1125, 2502); // 375 x 834 pada DPR 3.0
  tester.view.devicePixelRatio = 3.0;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(const SpotifyApp());
}

void main() {
  testWidgets('Diagnosis Header Search: judul, avatar, kamera, posisi', (tester) async {
    await _pumpApp(tester);
    await tester.tap(find.text('Search')); 
    await tester.pumpAndSettle();

    final avatar = find.byKey(const Key('search_avatar'));
    if (tester.any(avatar)) {
      print('SEARCH_AVATAR_POS: ${tester.getTopLeft(avatar)}');
      print('SEARCH_AVATAR_SIZE: ${tester.getSize(avatar)}');
    } else {
      print('SEARCH_AVATAR: NOT FOUND');
    }

    final titleFinder = find.byKey(const Key('search_title'));
    if (tester.any(titleFinder)) {
      print('SEARCH_TITLE_POS: ${tester.getTopLeft(titleFinder)}');
      print('SEARCH_TITLE_SIZE: ${tester.getSize(titleFinder)}');
    } else {
      print('SEARCH_TITLE: NOT FOUND');
    }

    final camera = find.byKey(const Key('search_camera'));
    if (tester.any(camera)) {
      print('SEARCH_CAMERA_POS: ${tester.getTopLeft(camera)}');
      print('SEARCH_CAMERA_SIZE: ${tester.getSize(camera)}');
    } else {
      print('SEARCH_CAMERA: NOT FOUND');
    }

    final field = find.byKey(const Key('search_field'));
    if (tester.any(field)) {
      print('SEARCH_FIELD_POS: ${tester.getTopLeft(field)}');
    } else {
      print('SEARCH_FIELD: NOT FOUND');
    }

    final tile0 = find.byKey(const Key('search_category_tile_0'));
    if (tester.any(tile0)) {
      print('SEARCH_TILE0_POS: ${tester.getTopLeft(tile0)}');
    } else {
      print('SEARCH_TILE0: NOT FOUND');
    }
  });

  testWidgets('Diagnosis Header Library', (tester) async {
    await _pumpApp(tester);
    await tester.tap(find.text('Your Library'));
    await tester.pumpAndSettle();

    final avatar = find.byKey(const Key('library_avatar'));
    if (tester.any(avatar)) {
      print('LIBRARY_AVATAR_POS: ${tester.getTopLeft(avatar)}');
    } else {
      print('LIBRARY_AVATAR: NOT FOUND');
    }

    final title = find.byKey(const Key('library_title'));
    if (tester.any(title)) {
      print('LIBRARY_TITLE_POS: ${tester.getTopLeft(title)}');
    } else {
      print('LIBRARY_TITLE: NOT FOUND');
    }
  });
}
