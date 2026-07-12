// integration_test/app_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:hab_gullyscorer/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Home screen loads and Start Match button works', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    // Verify HomeScreen title
    expect(find.text('GullyScore'), findsOneWidget);
    // Tap Start Match button
    final startButton = find.widgetWithIcon(ElevatedButton, Icons.sports_cricket);
    expect(startButton, findsOneWidget);
    await tester.tap(startButton);
    await tester.pumpAndSettle();
    // Verify navigation to MatchSetupScreen (simple check for "Match" text)
    expect(find.textContaining('Match'), findsWidgets);
  });
}
