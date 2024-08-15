import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/screens/auth/create_account.dart';
import 'package:scanner/screens/auth/login_screen.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';

class CheckSignUpProfile extends StatelessWidget {
  const CheckSignUpProfile({super.key});

  static String routeName = '/checkSignUpProfile';

  final int isColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          sizeHeight(20),
          Image.asset("assets/images/about.png"),
          sizeHeight(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  customGoNavigate(context, LoginScreen.routeName);
                },
                child: CustomCategoriesScrollItem(
                  width: 120,
                  text: "تسجيل الدخول",
                  isColor: isColor == 0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  customGoNavigate(context, CreateAccount.routeName);
                },
                child: CustomCategoriesScrollItem(
                  width: 120,
                  text: "إنشاء حساب",
                  isColor: isColor == 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
