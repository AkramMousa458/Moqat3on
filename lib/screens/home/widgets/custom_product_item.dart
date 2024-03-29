import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/product_model.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Expanded(
                    flex: 1,
                    child: Text(
                      productModel.name,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyle.stylesFont500Size16.copyWith(
                        color: AppColors.black,
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
    );
  }
}
