import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_examples/feature/counter/presentation/widgets/counter_view.dart';
import 'package:bloc_examples/feature/counter/presentation/bloc/counter_bloc.dart';

void main() {
  testWidgets('CounterView displays initial value', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(create: (_) => CounterBloc(), child: CounterView()),
      ),
    );

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('CounterView updates value dynamically', (
    WidgetTester tester,
  ) async {
    final bloc = CounterBloc();

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(create: (_) => bloc, child: CounterView()),
      ),
    );

    bloc.add(CounterIncrement());
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
