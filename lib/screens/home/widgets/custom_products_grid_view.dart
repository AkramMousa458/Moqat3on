import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/screens/home/widgets/custom_product_item.dart';
import 'package:scanner/screens/products_profiles/product_screen.dart';
import 'package:scanner/widgets/shimmer_loading_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomProductsGridView extends StatelessWidget {
  const CustomProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is GetProductsSuccess) {
            if (state.allProducts.isEmpty) {
              return const Center(child: Text('لا يوجد منتجات بعد!'));
            } else {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.9,
                ),
                itemCount: state.allProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        ProductScreen.routeName,
                        extra: state.allProducts[index],
                      );
                    },
                    child: CustomProductItem(
                      productModel: state.allProducts[index],
                    ),
                  );
                },
              );
            }
          } else {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.95,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Skeletonizer(
                  enabled: true,
                  child: CustomProductItem(
                    productModel: ProductModel(
                      id: 0,
                      name: '',
                      category: '',
                      boycott: '',
                      boycottReason: '',
                      country: '',
                      image: '',
                      rating: 0,
                    ),
                  ),
                );
              },
            );
            // return const Center(child: CustomLoadingWidget());
          }
        },
      ),
    );
  }
}
