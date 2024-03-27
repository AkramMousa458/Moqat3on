import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListView(
        // physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  "assets/products/مطاعم/كنتاكي.jpg",
                  width: MediaQuery.sizeOf(context).width / 3,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'User Name',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                'example@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey,
                ),
              )
            ],
          )

          // CustomSearchTextField(onChanged: (value) {}),
          // const CustomCategoriesScrollView(),
          // const CustomProductsGridView(),
          // const SizedBox(
          //   height: 30
          // ),
        ],
      ),
    );
  }
}
