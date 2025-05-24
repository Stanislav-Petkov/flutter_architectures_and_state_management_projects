import 'package:auto_route/annotations.dart';
import 'package:bloc_examples/feature/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_examples/feature/counter/presentation/widgets/counter_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}
