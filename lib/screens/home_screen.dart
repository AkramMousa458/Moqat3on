import 'package:flutter/material.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/screens/generate_qr_screen.dart';
import 'package:scanner/screens/scan_qr_screen.dart';
import 'package:scanner/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(kAppTitle)),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(text: 'Generate QR', screen: GenerateQrScreen()),
            SizedBox(height: 30),
            CustomButton(text: 'Scan QR', screen: ScanQrScreen(),)
          ],
        ),
      ),
    );
  }
}
