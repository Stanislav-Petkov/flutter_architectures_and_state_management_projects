import 'package:bloc_examples/feature/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group(CounterBloc, () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('Initial state is 0', () {
      expect(counterBloc.state, equals(0));
    });

    blocTest(
      'Emits[1] when CounterIncrement is added',
      build: () => counterBloc,
      act: (bloc) => bloc.add(CounterIncrement()),
      expect: () => [1],
    );

    blocTest(
      'Emits[-1] when CounterDecrement is pressed',
      build: () => counterBloc,
      act: (bloc) => bloc.add(CounterDecrement()),
      expect: () => [-1],
    );
  });
}
