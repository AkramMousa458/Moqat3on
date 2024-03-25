import 'package:flutter/material.dart';
import 'package:scanner/screens/home/widgets/custom_product_item.dart';

class CustomProductsGridView extends StatelessWidget {
  const CustomProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.97,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return const CustomProductItem();
      },
    );
  }
}