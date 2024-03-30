import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';

class CustomCategoriesScrollView extends StatefulWidget {
  const CustomCategoriesScrollView({
    super.key,
  });

  @override
  State<CustomCategoriesScrollView> createState() =>
      _CustomCategoriesScrollViewState();
}

class _CustomCategoriesScrollViewState
    extends State<CustomCategoriesScrollView> {
  List<String> itemText = [
    "الكل",
    "مطعاعم وكافيهات",
    "مشروبات",
    "جبن وألبان",
    "ملابس",
    "منظفات",
  ];

  int selectedIndex = 0;
  ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    final getProductsCubit = BlocProvider.of<GetProductsCubit>(
        context); 

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 80,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemText.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                if (index == 0) {
                  getProductsCubit.getAllProducts();
                } else {
                  getProductsCubit.getProductsByCategory(itemText[index]);
                }
              },
              child: CustomCategoriesScrollItem(
                text: itemText[index],
                isColor: index == selectedIndex,
              ),
            );
          },
        ),
      ),
    );
  }
}
