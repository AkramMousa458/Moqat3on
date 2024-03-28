import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
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
                //     Image.asset(
                //   "assets/products/مطاعم/كنتاكي.jpg",
                //   width: 135,
                //   height: 110,
                //   fit: BoxFit.cover,
                // ),
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
                  Expanded(
                    child: Text(
                      productModel.name,
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
