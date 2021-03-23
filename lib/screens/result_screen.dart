import 'package:bar_code_reader/model/stepper_data.dart';
import 'package:bar_code_reader/screens/instructions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// pop up Bottom Sheet
class ResultScreen extends StatelessWidget {
  ResultScreen(this.result);
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF161616),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Scan Result:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
              ),
            ),
            Text(
              '$result',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            FlatButton(
              onPressed: () {
                Provider.of<StepperData>(context, listen: false)
                    .setResult(result);
                Navigator.pushNamed(context, InstructionsScreen.id);
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Scan Again',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
