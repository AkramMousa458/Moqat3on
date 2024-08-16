import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/donate_model.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDonateItem extends StatelessWidget {
  const CustomDonateItem({super.key, required this.donateModel});
  final DonateModel donateModel;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      hoverColor: AppColors.redBlck,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.redBlck),
          boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 3,
                blurRadius: 30,
                offset: const Offset(0, 3),
              ),
            ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: donateModel.image,
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).width / 6,
              placeholder: (context, url) =>
                  const Center(child: CustomLoadingWidget()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            sizeHeight(5),
            Text(
              donateModel.name,
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
    ).animate().scale();
  }
}
