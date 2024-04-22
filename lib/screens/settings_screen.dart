import 'package:flutter/material.dart';

import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/auth/widgets/custom_button.dart';
import 'package:scanner/screens/home/widgets/cancel_duaa_notification.dart';
import 'package:scanner/widgets/custom_app_bar.dart';
import 'package:scanner/widgets/custom_button.dart';

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
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButtonApp(
                  onPressed: () {},
                  text: 'حذف الحساب',
                  color: AppColors.redBlck,
                )
                // CustomButton(
                //   onTap: () {},
                //   height: MediaQuery.sizeOf(context).height / 14,
                //   text: 'حذف الحساب',
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
