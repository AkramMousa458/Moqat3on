import 'package:flutter/material.dart';
import 'package:scanner/models/banned_category_model.dart';
import 'package:scanner/screens/home_screen.dart';
import 'package:scanner/screens/products_screen.dart';
import 'package:scanner/widgets/banned_category_card.dart';

class ProductsOutCategoryScreen extends StatelessWidget {
  ProductsOutCategoryScreen({super.key});

  final List<ProductsModel> bannedCategortList = [
    ProductsModel(
      name: 'المطاعم',
      img: 'assets/categories/مطاعم.jpg',
      screen: ProductsScreen(),
    ),
    ProductsModel(
      name: 'جبن',
      img: 'assets/categories/جبن.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'مشروبات',
      img: 'assets/categories/مشروبات.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'حلويات',
      img: 'assets/categories/حلويات.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'منتجات تجميل',
      img: 'assets/categories/منتجات تجميل.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'منتجات تنظيف',
      img: 'assets/categories/منتجات تنظيف.jpg',
      screen: const HomeScreen(),
    ),
    ProductsModel(
      name: 'هايبر',
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
        child: GridView.builder(
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
    );
  }
}
