import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/product_model.dart';

class CustomAlternativeItem extends StatelessWidget {
  const CustomAlternativeItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customReplacementNavigate(context, '/productScreen');
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
                  child: Image.network(
                    productModel.image,
                    width: 135,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    productModel.boycott == 'نعم'
                        ? Icon(
                            FontAwesomeIcons.ban,
                            color: AppColors.redBlck,
                          )
                        : Icon(
                            FontAwesomeIcons.check,
                            color: AppColors.primaryColor,
                          ),
                    // const Spacer(),
                    Expanded(
                      child: Text(
                        productModel.name,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.stylesFont500Size16.copyWith(
                          color: AppColors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
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
