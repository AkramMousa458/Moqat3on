import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/donate_model.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDonateWidget extends StatelessWidget {
  const CustomDonateWidget({super.key, required this.donateModel});
  final DonateModel donateModel;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      hoverColor: AppColors.redBlck,
      // color: AppColors.redBlck,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Border radius
      ),
      onPressed: () {
        launchUrl(
          Uri.parse(donateModel.url),
          mode: LaunchMode.externalApplication,
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.redBlck),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              donateModel.image,
              cacheHeight: 55,
              fit: BoxFit.cover,
            ),
            sizeHeight(5),
            Text(
              donateModel.text,
              textAlign: TextAlign.center,
              style: CustomTextStyle.stylesFont300Size16.copyWith(
                height: 1.2,
                color: AppColors.redBlck,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
              child: CustomCategoriesScrollItem(
                text: "تبرع الان",
                isColor: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
