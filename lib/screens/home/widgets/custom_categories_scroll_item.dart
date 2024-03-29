import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomCategoriesScrollItem extends StatelessWidget {
  CustomCategoriesScrollItem({
    super.key,
    required this.text,
    required this.isColor,
    this.width = 0.0,
  });

  final String text;
  final bool isColor;
  double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isColor ? AppColors.redBlck : null,
            border: Border.all(color: AppColors.redBlck),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isColor ? AppColors.offwhite : AppColors.redBlck,
            ),
          ),
        ),
      ),
    );
  }
}
