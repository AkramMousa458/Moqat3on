import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/screens/home/widgets/custom_alternative_item.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

List<ProductModel> alteProducts = [];

class ProductsAlternative extends StatelessWidget {
  const ProductsAlternative({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsFailure) {
          showCustomSnackBar(
              context: context, text: state.errMessage, status: false);
          return const SizedBox(width: 10);
        } else if (state is GetProductsSuccess) {
          alteProducts.clear();
          for (var product in state.allProducts) {
            if (product.category == productModel.category &&
                product.boycott == 'لا') {
              alteProducts.add(product);
            }
          }

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: alteProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return CustomAlternativeItem(
                productModel: alteProducts[index],
              );
            },
          );
        } else {
          return const Center(child: CustomLoadingWidget());
        }
      },
    );
  }
}
