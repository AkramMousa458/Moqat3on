import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';

class CustomDonateWidget extends StatelessWidget {
  const CustomDonateWidget({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 190,
      width: 150,
      padding: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.redBlck),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
            cacheHeight: 50,
          ),
          sizeHeight(5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: CustomTextStyle.stylesFont300Size16.copyWith(
              color: AppColors.redBlck,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CustomCategoriesScrollItem(
            text: "تبرع الان",
            width: 90,
            isColor: true,
          )
        ],
      ),
    );
  }
}
