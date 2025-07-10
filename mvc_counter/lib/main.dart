import 'package:flutter/material.dart';
import 'package:mvc_counter/counter_controller.dart';
import 'package:mvc_counter/counter_view.dart';

void main() {
  final counterController = CounterController();
  runApp(MyApp(controller: counterController));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.controller});

  final CounterController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterView(controller: controller));
  }
}
