import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/donate_model.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';
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
            CachedNetworkImage(
              imageUrl: donateModel.image,
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).width / 6,
              placeholder: (context, url) => const CustomLoadingWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            sizeHeight(5),
            Text(
              donateModel.text,
              textAlign: TextAlign.center,
              style: CustomTextStyle.stylesFont300Size16.copyWith(
                fontSize: 15,
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
