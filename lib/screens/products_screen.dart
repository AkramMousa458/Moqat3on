import 'package:flutter/material.dart';
import 'package:scanner/models/banned_category_model.dart';
import 'package:scanner/screens/home_screen.dart';
import 'package:scanner/widgets/banned_category_card.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final List<ProductsModel> bannedProductList = [
    ProductsModel(
      name: 'كنتاكي',
      img: 'assets/categories/مطاعم.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'ماك',
      img: 'assets/categories/جبن.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'ساب واي',
      img: 'assets/categories/مشروبات.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'برجر كنج',
      img: 'assets/categories/حلويات.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'بيتزا هات',
      img: 'assets/categories/منتجات تجميل.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'دومنوز بيتزا',
      img: 'assets/categories/منتجات تنظيف.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'ستار باكس',
      img: 'assets/categories/هايبر.jpg',
      screen: const HomeScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Moqata3a|مقاطعة',
            style: TextStyle(fontFamily: "ReadexPro"),
          ),
          backgroundColor: const Color.fromARGB(255, 88, 15, 15),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/red_bg.jpg'),
            fit: BoxFit.cover,
          )),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const Text(
                            ': المقاطعة',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: bannedProductList.length,
                          itemBuilder: (BuildContext context, int subIndex) {
                            return BannedCategoryCard(
                                bannedCategory: bannedProductList[subIndex]);
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
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const Text(
                            ': البدائل',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: bannedProductList.length,
                          itemBuilder: (BuildContext context, int subIndex) {
                            return BannedCategoryCard(
                                bannedCategory: bannedProductList[subIndex]);
                          },
                        ),
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
 // Container(
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //     image: AssetImage('assets/images/red_bg.jpg'),
          //     fit: BoxFit.cover,
          //   )),
          //   child: GridView.builder(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 20,
          //       childAspectRatio: 1,
          //       mainAxisSpacing: 20,
          //     ),
          //     padding: const EdgeInsets.all(25),
          //     itemCount: bannedCategortList.length,
          //     itemBuilder: (context, index) {
          //       return BannedCategoryCard(
          //         bannedCategory: bannedCategortList[index],
          //       );
          //     },
          //   ),
          // ),