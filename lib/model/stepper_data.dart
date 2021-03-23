import 'dart:collection';
import 'package:flutter/material.dart';

class StepperData extends ChangeNotifier {
  static int _currentStep = 0;
  String _result = '';

  List<Step> _steps = [
    Step(
      isActive: true,
      title: Text('Bottle Type'),
      content: Container(
          alignment: Alignment.centerLeft,
          child:
              Text("Let's suppose the bottle you scanned is a plastic one.")),
    ),
    Step(
      isActive: true,
      title: Text("Bottle Cap"),
      content: Container(
          alignment: Alignment.centerLeft,
          child: Text(
              'Unscrew the bottle cap and put it away in the designated container.')),
    ),
    Step(
      isActive: true,
      title: Text("Squeeze The Bottle "),
      content: Container(
          alignment: Alignment.centerLeft,
          child: Text(
              'Squeeze your plastic bottle and throw it away into designated trash bin.')),
    ),
  ];

  UnmodifiableListView<Step> get steps => UnmodifiableListView(_steps);

  int get currentStepIndex => _currentStep;

  String get result => _result;

  void setResult(String res) {
    _result = res;
  }

  void incrementStep() {
    if (_currentStep < _steps.length - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  void decrementStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void setStep(int index) {
    _currentStep = index;
    notifyListeners();
  }
}
