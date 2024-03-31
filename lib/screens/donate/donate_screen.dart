import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/donate_model.dart';
import 'package:scanner/screens/donate/widgets/custom_donate_widget.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<DonateModel> donateList = [
      DonateModel(
        text: 'الهلال الأحمر الفلسطيني',
        image: 'assets/images/donate.png',
        url: "https://www.palestinercs.org/ar",
      ),
      DonateModel(
        text: 'مصر الخير',
        image: "assets/images/donate.png",
        url: 'https://mekeg.org/ar/causes/support-gaza',
      ),
      DonateModel(
        text: 'بيت الزكاة',
        image: 'assets/images/donate2.png',
        url: 'https://baitzakat.org.eg/donationChannels/#5',
      )
    ];
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
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: donateList.length,
        itemBuilder: (context, index) {
          return CustomDonateWidget(
            donateModel: donateList[index],
          );
        },
      ),
    );
  }
}
