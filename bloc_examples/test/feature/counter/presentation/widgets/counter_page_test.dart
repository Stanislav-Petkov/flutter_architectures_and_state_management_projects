import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:bloc_examples/feature/counter/presentation/widgets/counter_page.dart';

void main() {
  testWidgets('CounterPage displays initial value', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('CounterPage increments value on button press', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('CounterPage decrements value on button press', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('-1'), findsOneWidget);
  });
}
