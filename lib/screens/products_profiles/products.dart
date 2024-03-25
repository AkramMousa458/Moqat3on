import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';

class ProductsProfiles extends StatefulWidget {
  const ProductsProfiles({Key? key}) : super(key: key);

  @override
  State<ProductsProfiles> createState() => _ProductsProfilesState();
}

class _ProductsProfilesState extends State<ProductsProfiles> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "كنتاكي",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8, top: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage("assets/products/مطاعم/كنتاكي.jpg"),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        " بلد المنشاء : امريكه  ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      sizeHeight(12),
                      const Text(
                        "مقطاعه : نعم",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      sizeHeight(10),
                      RatingBar(
                          initialRating: rating,
                          minRating: 1,
                          maxRating: 5,
                          onRatingUpdate: (newRating) =>
                              setState(() => rating = newRating),
                          itemCount: 5,
                          itemSize: 25.0,
                          glowColor: Colors.red,
                          allowHalfRating: true,
                          ratingWidget: RatingWidget(
                            empty: const Icon(Icons.star_border,
                                color: Colors.amber),
                            full: const Icon(Icons.star, color: Colors.amber),
                            half: const Icon(Icons.star_half,
                                color: Colors.amber),
                          )),
                      sizeHeight(5),
                      Text(' التقييمات :  $rating'),
                    ],
                  ),
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
              Text(
                ".............''البدائل ''.............",
                style: CustomTextStyle.stylesFont400Size22,
              ),
              sizeHeight(16),
              const AllProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return CustomItemProducts();
      },
    );
  }
}

class CustomItemProducts extends StatelessWidget {
  const CustomItemProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 135,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/products/مطاعم/بازوكا.jpg',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.star_outline,
                      color: Colors.black,
                    ),
                    Text(
                      "بازوكا",
                      style: CustomTextStyle.stylesFont300Size16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const String text =
    " تدعم KFC من خلال التبرعات الماليه بشكل مباشر الصندوق القومي اليهودي  وارسال وجبات غذاء لجيش الاسرئيلي  ";
