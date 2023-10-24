import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class GenerateQrScreen extends StatefulWidget {
  const GenerateQrScreen({super.key});

  @override
  State<GenerateQrScreen> createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> {
  String qr = 'Add Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create QR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BarcodeWidget(
            data: qr,
            barcode: Barcode.qrCode(),
            color: Colors.blue,
            width: 250,
            height: 250,
          ),
          SizedBox(height: 20, width: MediaQuery.sizeOf(context).width),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  qr = value;
                });
              },
              decoration: const InputDecoration(
                  hintText: 'Enter Data Here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2))),
            ),
          ),
        ],
      ),
    );
  }
}
