import 'package:flutter/material.dart';
import 'package:scanner/lists/milk_lists.dart';
import 'package:scanner/lists/markets_lists.dart';
import 'package:scanner/lists/restaurants_lists.dart';
import 'package:scanner/models/banned_category_model.dart';
import 'package:scanner/screens/products_screen.dart';
import 'package:scanner/widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<BannedCategoryModel> bannedCategortList = [
    BannedCategoryModel(
      name: 'مطاعم وكافيهات',
      img: 'assets/categories/مطاعم.jpg',
      screen: ProductsScreen(
        bannedProducts: restaurantsBannedProductList,
        replaceProducts: restaurantsReplaceProductList,
      ),
    ),
    BannedCategoryModel(
      name: 'جبن وألبان',
      img: 'assets/categories/جبن.jpg',
      screen: ProductsScreen(
          bannedProducts: milkBannedProductList,
          replaceProducts: milkReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'مشروبات',
      img: 'assets/categories/مشروبات.jpg',
      screen: ProductsScreen(
          bannedProducts: marketsBannedProductList,
          replaceProducts: marketsReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'حلويات',
      img: 'assets/categories/حلويات.jpg',
      screen: ProductsScreen(
          bannedProducts: marketsBannedProductList,
          replaceProducts: marketsReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'منتجات تجميل',
      img: 'assets/categories/منتجات تجميل.jpg',
      screen: ProductsScreen(
          bannedProducts: marketsBannedProductList,
          replaceProducts: marketsReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'منتجات تنظيف',
      img: 'assets/categories/منتجات تنظيف.jpg',
      screen: ProductsScreen(
          bannedProducts: marketsBannedProductList,
          replaceProducts: marketsReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'متاجر',
      img: 'assets/categories/متاجر.jpg',
      screen: ProductsScreen(
          bannedProducts: marketsBannedProductList,
          replaceProducts: marketsReplaceProductList),
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
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: 1,
              mainAxisSpacing: 20,
            ),
            padding: const EdgeInsets.all(25),
            itemCount: bannedCategortList.length,
            itemBuilder: (context, index) {
              return BannedCategoryCard(
                bannedCategory: bannedCategortList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
