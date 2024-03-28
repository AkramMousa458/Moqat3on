import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customNavigate(context, '/productScreen');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 12,
              left: 10,
              right: 10,
              bottom: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                      // Image.network(
                      //   'https://artwork.anghcdn.co/webp/?id=17272407&size=296',
                      //   width: 135,
                      //   height: 100,
                      //   fit: BoxFit.cover,
                      // ),
                      Image.asset(
                    "assets/products/مطاعم/كنتاكي.jpg",
                    width: 135,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      color: Colors.black,
                    ),
                    const Spacer(),
                    Text(
                      'كنتاكي',
                      style: CustomTextStyle.stylesFont500Size16.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
