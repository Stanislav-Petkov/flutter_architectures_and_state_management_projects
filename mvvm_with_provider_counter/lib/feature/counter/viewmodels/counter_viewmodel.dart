import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_counter/feature/counter/models/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _model = CounterModel();

  int get count => _model.count;

  void increment() {
    _model.increment();
    notifyListeners();
  }

  void reset() {
    _model.reset();
    notifyListeners();
  }
}
