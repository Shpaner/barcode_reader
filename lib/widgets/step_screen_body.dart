import 'package:bar_code_reader/constants.dart';
import 'package:bar_code_reader/screens/scanner_screen.dart';
import 'package:bar_code_reader/steps/final_step_screen.dart';
import 'package:bar_code_reader/steps/step_screen2.dart';
import 'package:bar_code_reader/steps/step_screen3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StepScreenBody extends StatelessWidget {
  final int currentScreenIndex;
  final String title;
  final String content;
  final String result;

  StepScreenBody(
      {@required this.currentScreenIndex,
      this.title,
      this.content,
      this.result});

  final Map<int, String> _nextScreens = {
    1: StepScreen2.id,
    2: StepScreen3.id,
    3: FinalStepScreen.id,
    4: ScannerScreen.id
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.chevronLeft),
                Text(
                  'Prev',
                ),
              ],
            ),
          ),
        ),
        title: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.pushNamed(context, ScannerScreen.id),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.recycle,
              color: Colors.green,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () =>
                Navigator.pushNamed(context, _nextScreens[currentScreenIndex]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Text(
                    currentScreenIndex < _nextScreens.length
                        ? 'Next'
                        : 'Scan Again',
                  ),
                  Icon(FontAwesomeIcons.chevronRight),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 130.0,
              ),
              Text(
                title,
                style: kStepTitleTextStyle,
              ),
              SizedBox(
                height: 35.0,
              ),
              Text(
                currentScreenIndex == 4 ? content + '\n' + result : content,
                textAlign: TextAlign.center,
                style: kStepContentTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
