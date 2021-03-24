import 'package:bar_code_reader/model/stepper_data.dart';
import 'package:bar_code_reader/widgets/step_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalStepScreen extends StatelessWidget {
  static const id = 'final_step_screen';

  @override
  Widget build(BuildContext context) {
    return StepScreenBody(
      currentScreenIndex: 4,
      title: Provider.of<StepperData>(context, listen: false).steps[3].title,
      content:
          Provider.of<StepperData>(context, listen: false).steps[3].instruction,
      result: Provider.of<StepperData>(context, listen: false).result,
    );
  }
}
