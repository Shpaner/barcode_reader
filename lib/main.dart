import 'package:bar_code_reader/screens/scanner_screen.dart';
import 'package:bar_code_reader/steps/final_step_screen.dart';
import 'package:bar_code_reader/steps/step_screen1.dart';
import 'package:bar_code_reader/steps/step_screen2.dart';
import 'package:bar_code_reader/steps/step_screen3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/stepper_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => StepperData(),
      child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            accentColor: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: ScannerScreen.id,
          routes: {
            ScannerScreen.id: (context) => ScannerScreen(),
            StepScreen1.id: (context) => StepScreen1(),
            StepScreen2.id: (context) => StepScreen2(),
            StepScreen3.id: (context) => StepScreen3(),
            FinalStepScreen.id: (context) => FinalStepScreen(),
          }),
    );
  }
}
