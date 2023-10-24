import 'package:flutter/material.dart';
import 'package:scanner/constants.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  double? width, height;
  String qrText = 'Scan it';
  List<String> banndedNumbers = [
    '729',
    '841',
    '871',
    '060',
    '139',
    '300',
    '379'
  ]; //israel, us, france,

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            qrText,
            style: const TextStyle(color: kMainColor, fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              scanQr();
            },
            child: const Text('Scanner'),
          ),
          SizedBox(
            width: width,
          )
        ],
      ),
    );
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
              '#2A99CF', 'Cancel', true, ScanMode.BARCODE)
          .then((value) {
        setState(() {
          for (var element in banndedNumbers) {
            if (value.substring(0, 3) == element) {
              qrText = 'مقاطعة';
            } else {
              qrText = 'متقلقش برا المقاطعة يا معلم';
            }
          }
        });
      });
    } catch (e) {
      setState(() {
        qrText = 'Error, Unable to read this qr';
      });
    }
  }
}
