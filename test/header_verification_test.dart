
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
  testWidgets('header Search: judul, avatar, kamera, posisi', (tester) async {
    await _pumpApp(tester);
    await tester.tap(find.text('Search')); 
    await tester.pumpAndSettle();

    final avatar = find.byKey(const Key('search_avatar'));
    expect(tester.getTopLeft(avatar).dx, closeTo(16, 1));
    expect(tester.getTopLeft(avatar).dy, closeTo(72, 1));
    expect(tester.getSize(avatar).width, closeTo(32, 1));

    final titleFinder = find.byKey(const Key('search_title'));
    expect(titleFinder, findsOneWidget);
    final title = tester.widget<Text>(titleFinder);
    expect(title.data, 'Search');
    expect(title.style?.color, const Color(0xFFFFFFFF));
    expect(title.style?.fontSize, 24);
    expect(tester.getTopLeft(titleFinder).dx, closeTo(64, 1));
    expect(tester.getTopLeft(titleFinder).dy, closeTo(72, 1));
    expect(tester.getSize(titleFinder).width, greaterThan(40));
    expect(tester.getSize(titleFinder).height, inInclusiveRange(31, 33));
    expect(find.ancestor(of: titleFinder, matching: find.byType(Opacity)), findsNothing);

    final camera = find.byKey(const Key('search_camera'));
    expect(tester.getTopLeft(camera).dx, closeTo(331, 1));
    expect(tester.getTopLeft(camera).dy, closeTo(74, 1));
    expect(tester.getSize(camera).width, closeTo(28, 1));
    expect(tester.getRect(titleFinder).right,
        lessThanOrEqualTo(tester.getRect(camera).left));

    expect(tester.getTopLeft(find.byKey(const Key('search_field'))).dy,
        closeTo(136, 1));
    expect(tester.getTopLeft(find.byKey(const Key('search_category_tile_0'))).dy,
        closeTo(200, 1));
  });

  testWidgets('avatar: latar #3A3A3A dan ikon orang #B3B3B3', (tester) async {
    await _pumpApp(tester);
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();

    final avatar = find.byKey(const Key('search_avatar'));
    final icon = find.descendant(of: avatar, matching: find.byIcon(Icons.person));
    expect(icon, findsOneWidget);
    expect(tester.widget<Icon>(icon).color, const Color(0xFFB3B3B3));

    final box = tester.widget<DecoratedBox>(
      find.descendant(of: avatar, matching: find.byType(DecoratedBox)).first,
    );
    expect((box.decoration as BoxDecoration).color, const Color(0xFF3A3A3A));
  });

  testWidgets('header Library: judul dan avatar', (tester) async {
    await _pumpApp(tester);
    await tester.tap(find.text('Your Library'));
    await tester.pumpAndSettle();

    final avatar = find.byKey(const Key('library_avatar'));
    expect(tester.getTopLeft(avatar).dx, closeTo(16, 1));
    expect(tester.getTopLeft(avatar).dy, closeTo(72, 1));

    final title = find.byKey(const Key('library_title'));
    expect(title, findsOneWidget);
    expect(tester.getTopLeft(title).dx, closeTo(64, 1));
    expect(tester.getTopLeft(title).dy, closeTo(72, 1));
    expect(tester.getSize(title).width, greaterThan(40));
  });
}
