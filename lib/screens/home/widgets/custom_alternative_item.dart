import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/screens/products_profiles/product_screen.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

class CustomAlternativeItem extends StatelessWidget {
  const CustomAlternativeItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushReplacement(
          ProductScreen.routeName,
          extra: productModel,
        );
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
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: productModel.image,
                    fit: BoxFit.cover,
                    height: MediaQuery.sizeOf(context).width / 4,
                    placeholder: (context, url) =>
                        const Center(child: CustomLoadingWidget()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    productModel.boycott == 'نعم'
                        ? const Icon(
                            FontAwesomeIcons.ban,
                            color: AppColors.redBlck,
                          )
                        : const Icon(
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
    ).animate().scale();
  }
}
