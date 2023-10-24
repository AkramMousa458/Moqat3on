import 'package:flutter/material.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/screens/home_screen.dart';

void main() {
  runApp(const Scanner());
}

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      home: HomeScreen(),
    );
  }
}
