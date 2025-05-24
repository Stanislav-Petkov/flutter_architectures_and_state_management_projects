import 'package:auto_route/auto_route.dart';
import 'package:bloc_examples/core/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Initial Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => context.router.push(CounterRoute()),
              child: Text('Counter Page'),
            ),
          ],
        ),
      ),
    );
  }
}
