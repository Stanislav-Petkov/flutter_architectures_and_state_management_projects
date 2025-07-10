import 'package:flutter/material.dart';
import 'package:mvc_counter/counter_model.dart';

class CounterController {
  final CounterModel _counterModel = CounterModel();
  final ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);

  void increment() {
    _counterModel.increment();
    counterNotifier.value = _counterModel.count;
  }

  void reset() {
    _counterModel.reset();
    counterNotifier.value = _counterModel.count;
  }
}
