import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  checkUserLoginStatus(context);
    super.initState();
  }


  void checkUserLoginStatus(context) async {
 final FirebaseAuth auth = FirebaseAuth.instance;

    Future.delayed(const Duration(seconds: 2), () {
      // التحقق من حالة المستخدم
       User? user = auth.currentUser;
        if (user != null) {
          // المستخدم مسجل الدخول، انتقل إلى الصفحة الرئيسية
          customReplacementNavigate(context, '/home');
        } else {
          // المستخدم غير مسجل الدخول، انتقل إلى صفحة تسجيل الدخول
          customReplacementNavigate(context, '/login');
        }
      });
    
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
