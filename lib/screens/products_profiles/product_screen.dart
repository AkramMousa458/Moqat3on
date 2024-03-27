import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/screens/products_profiles/widgets/custom_products_alternative.dart';
import 'package:scanner/screens/products_profiles/widgets/custom_rating_bar.dart';
import 'package:scanner/widgets/custom_appbar_app.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  double rating = 0.0;

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
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage("assets/products/مطاعم/كنتاكي.jpg"),
                  ),
                ),
              ),
              sizeHeight(10),
              Column(
                children: [
                  Text("كنتاكي",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold)),
                  sizeHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        " نعم ",
                        style:
                            TextStyle(color: AppColors.redBlck, fontSize: 20),
                      ),
                      const Text(
                        " : مقطاعة ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  sizeHeight(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "  امريكه  ",
                        style:
                            TextStyle(color: AppColors.redBlck, fontSize: 16),
                      ),
                      const Text(
                        " : بلد المنشاء  ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  sizeHeight(10),
                  CustomRatingBar(
                    onRatingUpdate: (value) {
                      rating = value;
                    },
                    rating: rating,
                  )
                ],
              ),
              sizeHeight(20),
              Text(
                " : سبب المقاطعة ",
                style: CustomTextStyle.stylesFont400Size22,
              ),
              sizeHeight(8),
              Text(
                text,
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
                "منتجات صناعة محلية بديل أفضل",
                style: CustomTextStyle.stylesFont300Size16.copyWith(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizeHeight(16),
              const ProductsAlternative(),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomItemProducts extends StatelessWidget {
//   const CustomItemProducts({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 135,
//           decoration: BoxDecoration(
//             color: Colors.black12,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Image.asset(
//                   'assets/products/مطاعم/بازوكا.jpg',
//                   height: 100,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 5, right: 5, top: 3),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Icon(
//                       Icons.star_outline,
//                       color: Colors.black,
//                     ),
//                     Text(
//                       "كنتاكي",
//                       style: CustomTextStyle.stylesFont300Size16,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

const String text =
    " تدعم KFC من خلال التبرعات الماليه بشكل مباشر الصندوق القومي اليهودي  وارسال وجبات غذاء لجيش الاسرئيلي  ";
