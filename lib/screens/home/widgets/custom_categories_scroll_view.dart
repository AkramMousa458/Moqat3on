import 'package:flutter/material.dart';
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
    "جبن وألبان",
    "مشروبات",
    " ملابس",
    "منظفات",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                print(itemText[index]);
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
