import 'dart:collection';
import 'package:flutter/material.dart';
import 'my_step.dart';

class StepperData extends ChangeNotifier {
  static String _result = '';

  List<MyStep> _steps = [
    MyStep(
        title: 'Bottle Type',
        instruction: "Let's suppose the bottle you scanned is a plastic one."),
    MyStep(
        title: 'Bottle Cap',
        instruction:
            'Unscrew the bottle cap and put it away in the designated container.'),
    MyStep(
        title: 'Last Step',
        instruction:
            'Squeeze your plastic bottle and throw it away into designated trash bin.'),
    MyStep(
        title: 'Congratulations!',
        instruction:
            'Thank you for taking care of our planet by properly utilizing plastic bottle of number: '),
  ];

  UnmodifiableListView<MyStep> get steps => UnmodifiableListView(_steps);

  String get result => _result;

  void setResult(String res) {
    _result = res;
  }
}
