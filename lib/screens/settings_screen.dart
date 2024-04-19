import 'package:flutter/material.dart';

import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/home/widgets/cancel_duaa_notification.dart';
import 'package:scanner/widgets/custom_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static String routeName = '/settingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  CustomAppBar(
                    title: 'الإعدادت',
                  ),
                  CancelDuaaNotifiaction(),
                  // CustomAppBar(title: 'Settings'),
                  // DarkMoodItem(),
                  // LanguageItem(),
                  // ContactUsItem(),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: CustomButton(
            //     text: Text('Logout', style: Styles.textStyle14),
            //     backgroundColor: AppColors.kRedColor,
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
