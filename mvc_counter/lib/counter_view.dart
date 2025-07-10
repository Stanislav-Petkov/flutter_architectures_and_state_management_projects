import 'package:flutter/material.dart';
import 'package:mvc_counter/counter_controller.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key, required this.controller});
  final CounterController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MVC Counter Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),
            ValueListenableBuilder(
              valueListenable: controller.counterNotifier,
              builder: (context, count, _) {
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
