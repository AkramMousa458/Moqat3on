import 'package:flutter/material.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';

class CustomCategoriesScrollView extends StatelessWidget {
  const CustomCategoriesScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return const CustomCategoriesScrollItem(
            text: 'مشروبات',
          );
        },
      ),
    );
  }
}