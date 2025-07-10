import 'package:bloc_examples/feature/counter/presentation/widgets/counter_page.dart';
import 'package:bloc_examples/feature/initial/presentaion/widgets/initial_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_examples/main.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter Feature Integration Test', () {
    testWidgets('App initializes with InitialPage', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(InitialPage), findsOneWidget);
    });

    testWidgets('Navigates to CounterPage and increments counter', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      // Verify InitialPage is displayed
      expect(find.byType(InitialPage), findsOneWidget);

      // Tap the button to navigate to CounterPage
      await tester.tap(find.text('Counter Page'));
      await tester.pumpAndSettle();

      // Verify CounterPage is displayed with initial counter value
      expect(find.byType(CounterPage), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      // Tap the increment button to increment the counter
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Verify the counter value is incremented
      expect(find.text('1'), findsOneWidget);
    });
  });
}
