import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';

const String url =
    'https://ngos.megakheir.com/donate/Egyptian-Red-Crescent/Ghazaa/1205?_gl=1*1j1u7y*_gcl_aw*R0NMLjE3MTE3MzkxMTAuQ2owS0NRand6Wm13QmhEOEFSSXNBSDR2MWdVdzkySldLUlpKcFBqZmtmY0ttYnRoWU1tSmVQY2ExR2xEQnk3eDFBQ09QbFpzaUNlSzNoWWFBanhNRUFMd193Y0I.*_gcl_au*MTY5Nzc0NjkwNC4xNzExNzM5MTEw';

class DonateScreen extends StatelessWidget {
  DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: Column(
        children: [
          sizeHeight(50),
          Text(
            "اختر جهه التبرع",
            style: CustomTextStyle.stylesFont600Size28.copyWith(
              color: AppColors.redBlck,
              fontWeight: FontWeight.w800,
            ),
          ),
          sizeHeight(50),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const customDonateWidget(
                  text: "الهلال الاحمر",
                  image: "assets/images/donate.png",
                ),
              ),
              sizeWidth(20),
              GestureDetector(
                onTap: () {},
                child: const customDonateWidget(
                  text: "الهلال الاحمر",
                  image: "assets/images/donate2.png",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class customDonateWidget extends StatelessWidget {
  const customDonateWidget({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 150,
      padding: const EdgeInsets.only(top: 8),
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
            "الهلال الاحمر",
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
