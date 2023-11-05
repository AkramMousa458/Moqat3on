import 'package:flutter/material.dart';
import 'package:scanner/lists/chips_lists.dart';
import 'package:scanner/lists/chocolate_lists.dart';
import 'package:scanner/lists/clean_lists.dart';
import 'package:scanner/lists/drinks_lists.dart';
import 'package:scanner/lists/milk_lists.dart';
import 'package:scanner/lists/markets_lists.dart';
import 'package:scanner/lists/restaurants_lists.dart';
import 'package:scanner/lists/tea_lists.dart';
import 'package:scanner/lists/water_lists.dart';
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
          bannedProducts: drinksBannedProductList,
          replaceProducts: drinksReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'شاي وقهوة',
      img: 'assets/categories/شاي وقهوة.jpg',
      screen: ProductsScreen(
          bannedProducts: teaBannedProductList,
          replaceProducts: teaReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'مياه',
      img: 'assets/categories/مياه.jpg',
      screen: ProductsScreen(
          bannedProducts: waterBannedProductList,
          replaceProducts: waterReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'شيبسي',
      img: 'assets/categories/شيبسي.jpg',
      screen: ProductsScreen(
          bannedProducts: chipsBannedProductList,
          replaceProducts: chipsReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'شيكولاتة وايس كريم',
      img: 'assets/categories/شيكولاتة وايس كريم.jpg',
      screen: ProductsScreen(
          bannedProducts: chocolateBannedProductList,
          replaceProducts: chocolateReplaceProductList),
    ),
    BannedCategoryModel(
      name: 'منتجات تنظيف',
      img: 'assets/categories/منتجات تنظيف.jpg',
      screen: ProductsScreen(
          bannedProducts: cleanBannedProductList,
          replaceProducts: cleanReplaceProductList),
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
