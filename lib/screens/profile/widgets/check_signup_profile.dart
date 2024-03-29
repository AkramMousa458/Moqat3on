import 'package:flutter/material.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';

import '../../../helper/styles/app_text_styles.dart';

class CheckSignUpProfile extends StatelessWidget {
  const CheckSignUpProfile({super.key});

  final int isColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          sizeHeight(20),
          Image.asset("assets/images/about.png"),
          sizeHeight(40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                customNavigate(context, "/login");
              },
              child: CustomCategoriesScrollItem(
                width: 120,
                text: "تسجيل الدخول",
                isColor: isColor == 0,
              ),
            ),
            GestureDetector(
              onTap: () {
                customNavigate(context, "/createAccount");
              },
              child: CustomCategoriesScrollItem(
                width: 120,
                text: "إنشاء حساب",
                isColor: isColor == 1,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
