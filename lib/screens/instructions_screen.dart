import 'package:bar_code_reader/model/stepper_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// screen with stepper
class InstructionsScreen extends StatelessWidget {
  static const String id = 'instructions_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to recycle the bottle!'),
        leading: Icon(
          FontAwesomeIcons.recycle,
          color: Colors.green,
        ),
      ),
      body: Consumer<StepperData>(
        builder: (context, stepperData, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'Your scan code is:',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  stepperData.result,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Stepper(
                currentStep: stepperData.currentStepIndex,
                onStepCancel: () => stepperData.decrementStep(),
                onStepContinue: () => stepperData.incrementStep(),
                onStepTapped: (index) => stepperData.setStep(index),
                steps: stepperData.steps,
              ),
            ],
          );
        },
      ),
    );
  }
}
