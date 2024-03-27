import 'package:flutter/widgets.dart';
import 'package:scanner/screens/home/widgets/custom_product_item.dart';

class ProductsAlternative extends StatelessWidget {
  const ProductsAlternative({
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
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return const Text('test');
        // return const CustomProductItem();
      },
    );
  }
}
