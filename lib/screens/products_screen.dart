import 'package:flutter/material.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/widgets/custom_app_bar.dart';
import 'package:scanner/widgets/head_title.dart';
import 'package:scanner/widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen(
      {super.key, required this.bannedProducts, required this.replaceProducts});

  static String routeName = '/productsScreen';
  final List<ProductModel> bannedProducts, replaceProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Moqata3a|مقاطعة'),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/red_bg.jpg'),
            fit: BoxFit.cover,
          )),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        const HeadTitle(text: ': المقاطة', color: Colors.red),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: bannedProducts.length,
                          itemBuilder: (BuildContext context, int subIndex) {
                            return ProductCard(
                              productModel: bannedProducts[subIndex],
                            );
                          },
                        ),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        const Divider(
                          color: Color.fromARGB(221, 134, 134, 134),
                          endIndent: 16,
                          indent: 16,
                          thickness: 1,
                        ),
                        const HeadTitle(
                            text: ': بعض البدائل', color: Colors.green),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: replaceProducts.length,
                          itemBuilder: (BuildContext context, int subIndex) {
                            return ProductCard(
                              productModel: replaceProducts[subIndex],
                            );
                          },
                        ),
                        const SubTitle(text: '(أو أي بديل محلي)'),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ));
  }
}
