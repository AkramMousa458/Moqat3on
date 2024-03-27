import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/product_model.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.productModel});

  final ProductModel productModel;

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
                      //   productModel.image ?? 'https://cdn1.img.sputnikarabic.ae/img/103348/26/1033482628_0:125:3071:1861_1920x0_80_0_0_78d5288220f5aee2dd0ccd6248eedf1e.jpg.webp',
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
                      productModel.name,
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
