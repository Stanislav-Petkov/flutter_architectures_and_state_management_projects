import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_counter/feature/counter/viewmodels/counter_viewmodel.dart';
import 'package:mvvm_with_provider_counter/feature/counter/views/counter_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CounterViewModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterView(),
    );
  }
}
