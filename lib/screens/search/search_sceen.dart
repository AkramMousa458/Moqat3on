import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/cubits/search_cubit/search_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/home/widgets/custom_search_text_field.dart';
import 'package:scanner/screens/search/widget/custom_search_gridview.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: Builder(
        builder: (context) {
          final SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
          return Scaffold(
            backgroundColor: AppColors.offwhite,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset('assets/images/hand.png'),
                ),
              ],
              title: const Text(
                'مقاطعة',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'إبحث عن منتج',
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.redBlck,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomSearchTextField(
                    goSearch: false,
                    onChanged: (value) {
                      searchCubit.searchProducts(
                        value,
                        BlocProvider.of<GetProductsCubit>(context)
                            .allProductsList,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const CustomSearchGridView(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
