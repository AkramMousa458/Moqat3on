import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/cubits/search_cubit/search_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_view.dart';
import 'package:scanner/screens/home/widgets/custom_products_grid_view.dart';
import 'package:scanner/screens/home/widgets/custom_search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProductCubit = BlocProvider.of<GetProductsCubit>(context);

    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: Builder(
        builder: (context) {
          final SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
          return Material(
            color: AppColors.offwhite,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomSearchTextField(onChanged: (value) {
                  print('Search query: $value');
                  print(
                      'All products list: ${addProductCubit.allProductsList}');
                  bloc.searchUsers(value, addProductCubit.allProductsList);
                }),
                const CustomCategoriesScrollView(),
                const CustomProductsGridView(),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
