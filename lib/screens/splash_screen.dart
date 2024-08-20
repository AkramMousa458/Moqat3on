// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/screens/home/navigator_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late bool isSkiped;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
          customReplacementNavigate(context, NavigatorWidget.routeName);
        });
    // firebaseAuth.authStateChanges().listen((user) {
    //   if (user == null) {
    //     Future.delayed(const Duration(seconds: 2), () {
    //       customReplacementNavigate(context, LoginScreen.routeName);
    //     });
    //   } else {
    //     Future.delayed(const Duration(seconds: 2), () {
    //       customReplacementNavigate(context, NavigatorWidget.routeName);
    //     });
    //   }
    // });

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
          color: AppColors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
            opacity: 0.5,
            // image: AssetImage('assets/images/black_bg.jpg'),
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
