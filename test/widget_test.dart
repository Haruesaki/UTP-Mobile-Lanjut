import 'package:flutter_test/flutter_test.dart';
import 'package:utp_mobile_spotify/main.dart';
import 'package:utp_mobile_spotify/app/app.dart';

void main() {
  testWidgets('App loads M2 shell', (WidgetTester tester) async {
    await tester.pumpWidget(const SpotifyApp());
    expect(find.text('Your recent rotation'), findsOneWidget);
  });
}

