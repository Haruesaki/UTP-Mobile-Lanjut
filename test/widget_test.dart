import 'package:flutter_test/flutter_test.dart';
import 'package:utp_mobile_spotify/main.dart';

void main() {
  testWidgets('App loads M0 screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Spotify UI M0'), findsOneWidget);
  });
}

