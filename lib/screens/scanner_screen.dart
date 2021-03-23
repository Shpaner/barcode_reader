import 'package:bar_code_reader/components/rounded_button.dart';
import 'package:bar_code_reader/screens/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScannerScreen extends StatelessWidget {
  static const String id = 'scanner_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to RecycHelper!'),
        leading: Icon(
          FontAwesomeIcons.recycle,
          color: Colors.green,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Scan the bottle of your choice and I'll show you how to recycle it!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RoundedButton(
                icon: FontAwesomeIcons.barcode,
                text: 'Scan Barcode',
                color: Colors.green,
                onPressed: () => scanCode(ScanMode.BARCODE, context),
              ),
              RoundedButton(
                icon: Icons.qr_code_sharp,
                text: 'Scan QR Code',
                color: Colors.blue,
                onPressed: () => scanCode(ScanMode.QR, context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> scanCode(ScanMode scanMode, BuildContext context) async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, scanMode);
      print(scanResult);
    } on PlatformException {
      scanResult = 'Failed to get platform version.';
    }

    showResult(context, scanResult);
  }

  void showResult(BuildContext context, String result) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => ResultScreen(result),
    );
  }
}
