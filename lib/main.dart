import 'package:bar_code_reader/screens/instructions_screen.dart';
import 'package:bar_code_reader/screens/scanner_screen.dart';
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
            InstructionsScreen.id: (context) => InstructionsScreen(),
          }),
    );
  }
}
