import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/screens/home/widgets/custom_product_item.dart';
import 'package:scanner/screens/products_profiles/product_screen.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          FocusScope.of(context).unfocus(); // Unfocus the keyboard
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var productsList = context.read<GetProductsCubit>().allProductsList;
    // var filteredList = productsList.where((product) {
    //   return product.name.toLowerCase().contains(query.toLowerCase());
    // }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: productsList.isEmpty
          ? const Center(child: Text('لا يوجد منتجات بعد'))
          : GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.98,
              ),
              itemCount: productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      ProductScreen.routeName,
                      extra: productsList[index],
                    );
                  },
                  child: CustomProductItem(
                    productModel: productsList[index],
                  ),
                );
              },
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var productsList = context.read<GetProductsCubit>().allProductsList;
    var filteredList = productsList.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: filteredList.isEmpty
          ? const Center(child: Text('لا يوجد منتج بهذا الإسم'))
          : GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.98,
              ),
              itemCount: filteredList.length, 
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      ProductScreen.routeName,
                      extra: filteredList[index], 
                    );
                  },
                  child: CustomProductItem(
                    productModel:
                        filteredList[index], 
                  ),
                );
              },
            ),
    );
  }
}
