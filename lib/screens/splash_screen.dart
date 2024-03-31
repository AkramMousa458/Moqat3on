import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late bool isSkiped;
  @override
  void initState() {
    firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        Future.delayed(const Duration(seconds: 2), () {
          customReplacementNavigate(context, '/login');
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          customReplacementNavigate(context, '/navigator');
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/black_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth / 4.2),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}
