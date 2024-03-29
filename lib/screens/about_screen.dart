import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightBlack,
        body: Column(
          children: [
            const SizedBox(height: 20),
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/about.png")),
            Text(
              "Moqat3a | مقاطعه",
              style: CustomTextStyle.stylesFont500Size24.copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.redBlck,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 26, right: 26),
              child: Text(
                "تطبيق مقاطعه هو تطبيق الهدف منه التخلص وعدم شراء منتجات تدعم الكيان الصهيونى و ذلك لانهم يقتلون المسلمين فى فلسطين",
                style: CustomTextStyle.stylesFont500Size16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
