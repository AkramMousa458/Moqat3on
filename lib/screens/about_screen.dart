import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/widgets/custom_link_icon.dart';
import 'package:scanner/widgets/custom_text.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/about.png"),
          ),
          Text(
            "Moqat3a | مقاطعه",
            textAlign: TextAlign.center,
            style: CustomTextStyle.stylesFont500Size24.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.redBlck,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Text(
              "تطبيق مقاطعه هو تطبيق الهدف منه التخلص وعدم شراء منتجات تدعم الكيان الصهيونى و ذلك لانهم يقتلون المسلمين ويشنون حرب الإبادة علي فلسطين",
              style: CustomTextStyle.stylesFont500Size16.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              CustomText(
                text: ': تعليمات',
                size: 22,
                isBold: true,
              ),
              SizedBox(height: 20),
              ListTile(
                trailing: Icon(
                  Icons.done_outline_rounded,
                ),
                title: CustomText(
                  text: 'يرجى مسح الكاميرا جيداََ قبل تصوير بار كود المنتج',
                  size: 16,
                  textAlign: TextAlign.right,
                ),
              ),
              ListTile(
                trailing: Icon(
                  Icons.done_outline_rounded,
                ),
                title: CustomText(
                  text:
                      'يرجى التأكد من عدم وجود ثنيات أو لمعان علي البار الكود للحصول علي نتيجة صحيحة',
                  size: 16,
                  textAlign: TextAlign.right,
                ),
              ),
              ListTile(
                trailing: Icon(
                  Icons.done_outline_rounded,
                ),
                title: CustomText(
                  text:
                      'يرجى التأكد من مسح الكود الخاص بالمنتج نفسه وليس الملصق الخاص بالمتجر',
                  size: 16,
                  textAlign: TextAlign.right,
                ),
              ),
              ListTile(
                trailing: Icon(
                  Icons.done_outline_rounded,
                ),
                title: CustomText(
                  text:
                      'يرجي متابعة قناة التليجرام الخاصة بالتطبيق لمتابعة التحديثات',
                  size: 16,
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLinkIcon(
                    icon: FontAwesomeIcons.telegram,
                    color: AppColors.telegramColor,
                    url: 'https://t.me/Moqata3aApp',
                  ),
                  CustomLinkIcon(
                    icon: FontAwesomeIcons.linkedin,
                    color: AppColors.linkedInColor,
                    url:
                        'https://www.linkedin.com/in/akram-mousa-29a83b206?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                  ),
                ],
              ),
              SizedBox(height: 15),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'الإبلاغ عن مشكلة ما:',
                      size: 20,
                    ),
                    CustomLinkIcon(
                      icon: Icons.bug_report,
                      color: AppColors.redBlck,
                      url: 'https://forms.gle/UZfRvfcWa1UHNKbVA',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              CustomText(
                text: '(الإصدار: 2.0.1) 🇵🇸 لا تنسوا الدعاء لإخواننا في فلسطين',
                size: 12,
              ),
              SizedBox(height: 40),
            ],
          )
        ],
      ),
    );
  }
}
