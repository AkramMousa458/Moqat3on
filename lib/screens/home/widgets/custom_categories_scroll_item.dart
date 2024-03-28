import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomCategoriesScrollItem extends StatelessWidget {
  const CustomCategoriesScrollItem({
    super.key,
    required this.text,
    required this.isColor,
  });

  final String text;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isColor ? AppColors.redBlck : null,
            border: Border.all(color: AppColors.redBlck),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: isColor ? AppColors.offwhite : AppColors.redBlck,
            ),
          ),
        ),
      ),
    );
  }
}
