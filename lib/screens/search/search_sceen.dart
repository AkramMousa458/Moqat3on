// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
// import 'package:scanner/cubits/search_cubit/search_cubit.dart';
// import 'package:scanner/helper/colors.dart';
// import 'package:scanner/screens/home/widgets/custom_search_text_field.dart';
// import 'package:scanner/screens/search/widget/custom_search_gridview.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
// static String routeName = '/searchScreen';
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<SearchCubit>(
//       create: (context) => SearchCubit(),
//       child: Builder(
//         builder: (context) {
//           final SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
//           return Scaffold(
//             backgroundColor: AppColors.offwhite,
//             appBar: AppBar(
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.arrow_back_ios_new_rounded),
//               ),
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 16),
//                   child: Image.asset('assets/images/hand.png'),
//                 ),
//               ],
//               title: const Text(
//                 'مقاطعة',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 28,
//                 ),
//               ),
//               centerTitle: true,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//               child: ListView(
//                 physics: const BouncingScrollPhysics(),
//                 children: [
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'إبحث عن منتج',
//                         style: TextStyle(
//                           fontSize: 22,
//                           color: AppColors.redBlck,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   CustomSearchTextField(
//                     goSearch: false,
//                     onChanged: (value) {
//                       searchCubit.searchProducts(
//                         value,
//                         BlocProvider.of<GetProductsCubit>(context)
//                             .allProductsList,
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   const CustomSearchGridView(),
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/screens/home/widgets/custom_product_item.dart';
import 'package:scanner/screens/products_profiles/product_screen.dart';

class CustomSearch extends SearchDelegate {
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
          FocusScope.of(context).unfocus(); // Unfocus the keyboard
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var productsList = context.read<GetProductsCubit>().allProductsList;
    var filteredList = productsList.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: filteredList.isEmpty
          ? const Center(child: Text('لا يوجد منتجات بهذا الإسم'))
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.9,
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
    var filteredList = productsList.where((coupon) {
      return coupon.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: filteredList.isEmpty
          ? const Center(child: Text('لا يوجد منتج بهذا الإسم'))
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.9,
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
}
