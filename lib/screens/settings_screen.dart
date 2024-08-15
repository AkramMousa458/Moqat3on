import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/home/widgets/cancel_duaa_notification_widget.dart';
import 'package:scanner/widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static String routeName = '/settingsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                  CancelDuaaNotifiactionWidget(),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: CustomButtonApp(
            //     onPressed: () {},
            //     text: 'حذف الحساب',
            //     color: AppColors.redBlck,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
