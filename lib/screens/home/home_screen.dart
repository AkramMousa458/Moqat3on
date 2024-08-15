import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/search_cubit/search_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_view.dart';
import 'package:scanner/screens/home/widgets/custom_products_grid_view.dart';
import 'package:scanner/screens/home/widgets/custom_search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: Builder(
        builder: (context) {
          return Material(
            color: AppColors.white,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomSearchTextField(
                  onChanged: (value) {},
                ),
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
