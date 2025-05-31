import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_examples/feature/counter/presentation/bloc/counter_bloc.dart';

void main() {
  group('CounterBloc', () {
    test('initial state is correct', () {
      final bloc = CounterBloc();
      expect(bloc.state, equals(0));
    });

    test('increment event updates state correctly', () {
      final bloc = CounterBloc();
      bloc.add(CounterIncrement());
      expectLater(bloc.stream, emitsInOrder([1]));
    });

    test('decrement event updates state correctly', () {
      final bloc = CounterBloc();
      bloc.add(CounterDecrement());
      expectLater(bloc.stream, emitsInOrder([-1]));
    });
  });
}
