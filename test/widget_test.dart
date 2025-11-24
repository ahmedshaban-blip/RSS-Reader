import 'package:rss_reader_pro/main.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Splash screen text smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our title text is present.
    expect(find.text('RSS Reader Pro'), findsOneWidget);
    
    expect(find.textContaining('Ahmed Shaban'), findsOneWidget);

    expect(find.text('0'), findsNothing);
  });
}