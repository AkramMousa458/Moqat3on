import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/screens/donate/widgets/custom_donate_widget.dart';
import 'package:url_launcher/url_launcher.dart';


const String url =
    'https://ngos.megakheir.com/donate/Egyptian-Red-Crescent/Ghazaa/1205?_gl=1*1j1u7y*_gcl_aw*R0NMLjE3MTE3MzkxMTAuQ2owS0NRand6Wm13QmhEOEFSSXNBSDR2MWdVdzkySldLUlpKcFBqZmtmY0ttYnRoWU1tSmVQY2ExR2xEQnk3eDFBQ09QbFpzaUNlSzNoWWFBanhNRUFMd193Y0I.*_gcl_au*MTY5Nzc0NjkwNC4xNzExNzM5MTEw';
const String url2 = "https://baitzakat.org.eg/donationChannels/#5";
const String url3 = "https://www.palestinercs.org/ar";

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            "اختر جهه التبرع",
            style: CustomTextStyle.stylesFont600Size28.copyWith(
              color: AppColors.redBlck,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.9,
        ),
        children: [
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(url3), mode: LaunchMode.externalApplication);
            },
            child: const CustomDonateWidget(
              text: "الهلال الحمر الفلسطيني",
              image: "assets/images/donate.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
            },
            child: const CustomDonateWidget(
              text: "الهلال الاحمر",
              image: "assets/images/donate.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(url2), mode: LaunchMode.externalApplication);
            },
            child: const CustomDonateWidget(
              text: "بيت الزكاة",
              image: "assets/images/donate2.png",
            ),
          ),
        ],
      ),
    );
  }
}

