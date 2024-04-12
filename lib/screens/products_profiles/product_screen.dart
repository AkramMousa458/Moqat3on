import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/screens/products_profiles/widgets/custom_products_alternative.dart';
import 'package:scanner/screens/products_profiles/widgets/custom_rating_bar.dart';
import 'package:scanner/widgets/custom_appbar_app.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 8,
          ),
          child: Column(
            children: [
              const CustomAppBAr(),
              sizeHeight(20),
              Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      widget.productModel.image,
                      errorListener: (p0) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              sizeHeight(10),
              Column(
                children: [
                  Text(
                    widget.productModel.name,
                    style: const TextStyle(
                      fontSize: 25,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizeHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.productModel.boycott,
                        style: const TextStyle(
                            color: AppColors.redBlck, fontSize: 20),
                      ),
                      const Text(
                        " : مقطاعة ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  sizeHeight(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.productModel.country,
                        style: const TextStyle(
                            color: AppColors.redBlck, fontSize: 16),
                      ),
                      const Text(
                        " : بلد المنشاء  ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  sizeHeight(10),
                  if (widget.productModel.boycott == 'لا')
                    CustomRatingBar(
                      rating: widget.productModel.rating,
                    )
                ],
              ),
              sizeHeight(20),
              widget.productModel.boycott == "نعم"
                  ? const Text(
                      " : سبب المقاطعة",
                      style: CustomTextStyle.stylesFont400Size22,
                    )
                  : const Text(
                      " : افضل بديل",
                      style: CustomTextStyle.stylesFont400Size22,
                    ),
              sizeHeight(8),
              Text(
                widget.productModel.boycottReason,
                style:
                    CustomTextStyle.stylesFont500Size14.copyWith(height: 1.8),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
              sizeHeight(12),
              Divider(
                color: AppColors.black.withOpacity(0.5),
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              Text(
                widget.productModel.boycott == "نعم"
                    ? "منتجات صناعة محلية بديل أفضل"
                    : 'منتجات بديلة أخري',
                style: CustomTextStyle.stylesFont300Size16.copyWith(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizeHeight(16),
              ProductsAlternative(
                productModel: widget.productModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
