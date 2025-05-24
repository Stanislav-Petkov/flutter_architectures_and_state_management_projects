import 'package:auto_route/annotations.dart';
import 'package:bloc_examples/feature/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text('$count', style: TextStyle(fontSize: 24.0)),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'incrementButton',
              child: Icon(Icons.add),
              onPressed:
                  () => context.read<CounterBloc>().add(CounterIncrement()),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'decrementButton', 
              child: Icon(Icons.remove),
              onPressed:
                  () => context.read<CounterBloc>().add(CounterDecrement()),
            ),
          ),
        ],
      ),
    );
  }
}
