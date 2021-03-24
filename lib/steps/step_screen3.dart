import 'package:bar_code_reader/model/stepper_data.dart';
import 'package:bar_code_reader/widgets/step_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepScreen3 extends StatelessWidget {
  static const id = 'step_screen3';

  @override
  Widget build(BuildContext context) {
    return StepScreenBody(
      currentScreenIndex: 3,
      title: Provider.of<StepperData>(context, listen: false).steps[2].title,
      content:
          Provider.of<StepperData>(context, listen: false).steps[2].instruction,
    );
  }
}
