import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/cubits/search_cubit/search_cubit.dart';
import 'package:scanner/screens/home/widgets/custom_product_item.dart';
import 'package:scanner/screens/products_profiles/product_screen.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

class CustomSearchGridView extends StatelessWidget {
  const CustomSearchGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchFailure) {
            return const Center(
              child: Text('المنتج غير متوفر'),
            );
          } else if (state is SearchSuccess) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.9,
              ),
              itemCount: searchCubit.filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      ProductScreen.routeName,
                      extra: searchCubit.filteredList[index],
                    );
                  },
                  child: CustomProductItem(
                    productModel: searchCubit.filteredList[index],
                  ),
                );
              },
            );
          } else if (state is SearchInitial) {
            return const SizedBox();
          } else {
            return const Center(child: CustomLoadingWidget());
          }
        },
      ),
    );
  }
}
